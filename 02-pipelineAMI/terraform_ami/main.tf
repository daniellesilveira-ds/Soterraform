provider "aws" {
  region = "sa-east-1"
}

# resource "aws_ami_from_instance" "ami-projetofinal" {
#   name               = "terraform-projetofinal"
#   source_instance_id = "0"
# }

resource "aws_ami_from_instance" "ami-projetofinal" {
  name               = "terraform-projetofinal-${var.versao}"
  source_instance_id = var.resource_id
}


variable "resource_id" {
  type        = string
  default = "1"
}

variable "versao" {
  type        = string
 default = "1"
}

output "ami" {
  value = [
    "AMI: ${aws_ami_from_instance.ami-projetofinal.id}"
  ]
}
