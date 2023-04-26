terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 3.27"
      }
    }
    
  required_version = ">= 0.14.9"
}

provider "aws" {
    region = "us-east-1"
    profile = "default"
}

resource "aws_instance" "app_server" {
    ami = "ami-007855ac798b5175e"
    instance_type = "t2.micro"
    key_name = "challenge-devops"
    user_data = <<-EOF
                   #!/bin/bash
                   cd /home/ubuntu
                   echo "<h1>Instância criada</h1>" > index.html
                   nohup busybox httpd -f -p 8080 &
                   EOF
    tags = {
        Name = "Challenge DevOps Alura"
    }
}