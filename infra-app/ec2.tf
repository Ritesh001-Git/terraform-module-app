# Key-Pair
resource "aws_key_pair" "my-key" {
  key_name   = "${var.env}-infra-app-key"
  public_key = file("terra-key-ec2.pub")
}
# VPC
resource "aws_default_vpc" "default" {

}
# Security Group
resource "aws_security_group" "my-sg" {
  name        = "${var.env}-infra-app-sg"
  description = "A TF generated SG"
  vpc_id      = aws_default_vpc.default.id # Interpolation

  # Inbound Rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP open"
  }
  # Outbound Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # semantically equivalent to all ports
    cidr_blocks = ["0.0.0.0/0"]
    description = "All access open outbound"
  }
  tags = {
    Name = "${var.env}-infra-app-sg"
  }
}
#ec2 instance
resource "aws_instance" "my_instance" {
  count           = var.instance_count
  key_name        = aws_key_pair.my-key.key_name
  security_groups = [aws_security_group.my-sg.name]
  instance_type   = var.instance_type
  ami             = var.ami_id
  root_block_device {
    volume_size = var.env == "prd" ? 20 : 10
    volume_type = "gp3"
  }
  tags = {
    Name        = "${var.env}-infra-app-ec2"
    Environment = var.env
  }
}
