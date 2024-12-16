provider "aws" {
  region = "us-east-1"
}

locals {
   ingress_rules = [{
      port        = 443
      description = "Ingress rules for port 443"
   },
   {
      port        = 80
      description = "Ingree rules for port 80"
   }]
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16" 
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_instance" "name" {
  ami = var.ami
  instance_type = var.instance_type
  

  associate_public_ip_address = var.enable_public_ip
  
  tags = {
    Name = "myinstance"
  }
}

resource "aws_security_group" "main" {
   name   = "resource_with_dynamic_block"
   vpc_id = aws_vpc.main.id

   dynamic "ingress" {
      for_each = local.ingress_rules

      content {
         description = ingress.value.description
         from_port   = ingress.value.port
         to_port     = ingress.value.port
         protocol    = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
      }
   }

   tags = {
      Name = "AWS security group dynamic block"
   }
}
