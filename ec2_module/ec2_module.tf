variable "vpcid"{
    type = string
    default = "vpc-cdd92ab0"
}

resource "aws_security_group" "terraform_ec2_sg" {
  name        = "terraform_ec2_sg"
  description = "sg for ec2"
  vpc_id      = "${var.vpcid}"

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

variable "amiid"{
    type = string
    default = "ami-0d5eff06f840b45e9"
}
resource "aws_instance" "terraform_ec2_instance" {
  ami = "${var.amiid}"
  instance_type = "t2.micro"
  key_name = "Docker"
  vpc_security_group_ids=["${aws_security_group.terraform_ec2_sg.id}"]


  tags = {
    Name = "Terraform Ec2 Instance"
  }
}