provider "aws" {
  region = var.region
}

resource "aws_instance" "FCT" {
  ami = var.image
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.sg.id ]
  tags = {
    Name = "Terraform-instance"
  }
}

data "aws_security_group" "sg" {
  name = "Terraform-sg"
  vpc_id = "vpc-07da03033c1eafc3c"
}