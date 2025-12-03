output "control_plane_public_ip" {
  value = aws_instance.control_plane[0].public_ip
}

output "worker_public_ips" {
  value = [for i in aws_instance.worker : i.public_ip]
}

output "ssh_private_key_path" {
  value = local_file.private_key_pem.filename
}

output "kubeconfig_hint" {
  value = "ssh -i ${local_file.private_key_pem.filename} ubuntu@${aws_instance.control_plane[0].public_ip} 'sudo cat /etc/rancher/k3s/k3s.yaml'"
}
