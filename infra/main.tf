# Generate ephemeral SSH private key for the cluster (RSA 4096)
resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Publish public key to AWS to allow SSH access
resource "aws_key_pair" "k3s" {
  key_name   = var.ssh_key_name
  public_key = tls_private_key.ssh.public_key_openssh
}

# Write SSH private key locally (chmod 600)
resource "local_file" "private_key_pem" {
  content              = tls_private_key.ssh.private_key_pem
  filename             = "${path.module}/k3s-key.pem"
  file_permission      = "0600"
  directory_permission = "0700"
}

## Explicit IDs provided via variables (no Describe calls)

# Security Group for control-plane (ingress rules from machines.control_plane.ports)
resource "aws_security_group" "control_plane" {
  name        = "k3s_control_plane_sg"
  description = "security group for k3s control-plane"

  dynamic "ingress" {
    for_each = [for p in var.machines.control_plane.ports : p if p.self == false]
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "ingress" {
    for_each = [for p in var.machines.control_plane.ports : p if p.self == true]
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      self        = true
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group for workers (ingress rules from machines.worker.ports)
resource "aws_security_group" "worker" {
  name        = "k3s_worker_sg"
  description = "security group for k3s workers"

  dynamic "ingress" {
    for_each = [for p in var.machines.worker.ports : p if p.self == false]
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "ingress" {
    for_each = [for p in var.machines.worker.ports : p if p.self == true]
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      self        = true
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Shared k3s token for node join (not stored at rest)
resource "random_password" "k3s_token" {
  length  = 48
  special = false
}

locals {
  common_tags = {
    project = "k3s_terraform"
  }
}

# EC2 control-plane instance(s) with k3s install via user_data
resource "aws_instance" "control_plane" {
  count                       = var.machines.control_plane.count
  ami                         = var.ami_id
  instance_type               = var.machines.control_plane.instance_type
  key_name                    = aws_key_pair.k3s.key_name
  vpc_security_group_ids      = [aws_security_group.control_plane.id]
  associate_public_ip_address = true

  # **ADDED**
  user_data = <<EOF
#!/bin/bash
apt-get update -y
apt-get install -y curl
EOF

  tags = merge(local.common_tags, var.machines.control_plane.tags, { role = "master", name = "k3s_master" })
}

# EC2 worker instances that join the control-plane via token
resource "aws_instance" "worker" {
  count                       = var.machines.worker.count
  ami                         = var.ami_id
  instance_type               = var.machines.worker.instance_type
  key_name                    = aws_key_pair.k3s.key_name
  vpc_security_group_ids      = [aws_security_group.worker.id]
  associate_public_ip_address = true
  depends_on                  = [aws_instance.control_plane]

  # **ADDED**
  user_data = <<EOF
#!/bin/bash
apt-get update -y
apt-get install -y curl
EOF

  tags = merge(local.common_tags, var.machines.worker.tags, { role = "worker", name = "k3s_worker_${count.index}" })
}

# Bootstrap k3s server on control-plane via remote-exec
resource "null_resource" "bootstrap_control_plane" {
  depends_on = [aws_instance.control_plane]

  triggers = {
    instance_id = aws_instance.control_plane[0].id
  }

  connection {
    type        = "ssh"
    host        = aws_instance.control_plane[0].public_ip
    user        = "ubuntu"
    private_key = tls_private_key.ssh.private_key_pem
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Installing K3s control-plane with public IP in certificate...'",
      "MASTER_PUBLIC_IP=${aws_instance.control_plane[0].public_ip}",
      "curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC=\"server --tls-san $MASTER_PUBLIC_IP --write-kubeconfig-mode 644\" sh -",
      "sleep 30",
      "sudo k3s kubectl get node",
      "sudo cat /var/lib/rancher/k3s/server/node-token > /tmp/node-token",
      "sudo chown ubuntu:ubuntu /tmp/node-token"
    ]
  }
}

# Pull node token from control-plane to local to distribute to workers
resource "null_resource" "fetch_node_token" {
  depends_on = [null_resource.bootstrap_control_plane]

  triggers = {
    instance_id = aws_instance.control_plane[0].id
  }

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command     = <<EOT
IP="${aws_instance.control_plane[0].public_ip}"
KEY_FILE="${local_file.private_key_pem.filename}"
DEST="${path.module}/node-token"
ssh -i "$KEY_FILE" -o StrictHostKeyChecking=accept-new ubuntu@"$IP" 'sudo cat /tmp/node-token' > "$DEST"
chmod 600 "$DEST"
echo "Fetched node-token to $DEST"
EOT
  }
}

# Bootstrap k3s agent on workers via remote-exec
resource "null_resource" "bootstrap_workers" {
  count      = length(aws_instance.worker)
  depends_on = [aws_instance.control_plane, aws_instance.worker, null_resource.fetch_node_token]

  triggers = {
    worker_id = aws_instance.worker[count.index].id
    master_ip = aws_instance.control_plane[0].private_ip
  }

  connection {
    type        = "ssh"
    host        = aws_instance.worker[count.index].public_ip
    user        = "ubuntu"
    private_key = tls_private_key.ssh.private_key_pem
  }

  # Upload token to worker before installation
  provisioner "file" {
    source      = "${path.module}/node-token"
    destination = "/home/ubuntu/node-token"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Installing K3s agent on worker ${count.index} ...'",
      "MASTER_IP=${aws_instance.control_plane[0].private_ip}",
      "TOKEN=$(cat /home/ubuntu/node-token)",
      "curl -sfL https://get.k3s.io | K3S_URL=\"https://$MASTER_IP:6443\" K3S_TOKEN=\"$TOKEN\" sh -",
    ]
  }
}

resource "null_resource" "fetch_kubeconfig" {
  depends_on = [
    null_resource.bootstrap_control_plane,
    null_resource.bootstrap_workers
  ]

  provisioner "remote-exec" {
    inline = [
      "sudo cp /etc/rancher/k3s/k3s.yaml /tmp/k3s.yaml",
      "sudo chmod 644 /tmp/k3s.yaml"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = tls_private_key.ssh.private_key_pem
      host        = aws_instance.control_plane[0].public_ip
    }
  }

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command = <<EOT
scp -o StrictHostKeyChecking=accept-new -i ${local_file.private_key_pem.filename} \
  ubuntu@${aws_instance.control_plane[0].public_ip}:/tmp/k3s.yaml ${path.module}/k3s.yaml

sed -i "s/127.0.0.1/${aws_instance.control_plane[0].public_ip}/" ${path.module}/k3s.yaml
echo "Kubeconfig ready at ${path.module}/k3s.yaml"
EOT
  }
}
