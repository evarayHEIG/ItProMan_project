variable "aws" {
  description = "AWS configuration."
  type = object({
    region = string
  })
}

variable "ami_id" {
  description = "AMI ID to use for EC2 instances in the selected region."
  type        = string
}

variable "ssh_key_name" {
  description = "Name of the SSH key to create in AWS KeyPair."
  type        = string
}

variable "machines" {
  description = "Machine configurations per role"
  type = object({
    control_plane = object({
      instance_type = string
      disk_size     = number
      count         = number
      ports = list(object({
        description = string
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
        self        = optional(bool, false)
      }))
      tags = optional(map(string), {})
    })
    worker = object({
      instance_type = string
      disk_size     = number
      count         = number
      ports = list(object({
        description = string
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
        self        = optional(bool, false)
      }))
      tags = optional(map(string), {})
    })
  })

  validation {
    condition     = var.machines.control_plane.count == 1
    error_message = "control_plane.count must be 1."
  }
}
