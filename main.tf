terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "jenkins-source" {
  count         = 2
  ami           = "ami-0c802847a7dd848c0"
  instance_type = "t2.micro"
  tags = {
    Name = "ec2-test1"
  }
}