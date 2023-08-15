provider "aws" {
  region = "us-east-1" # Replace with your desired region
}

resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "example_subnet" {
  vpc_id     = aws_vpc.example_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_security_group" "instance_sg" {
  count = 2

  name_prefix = "instance-sg-testing-grounds-${count.index}"

  vpc_id = aws_vpc.example_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["YOUR_IP_ADDRESS"] # Replace with your IP address
  }
}

resource "aws_instance" "example_instance" {
  count = 2

  ami           = "ami-0c55b159cbfafe1f0" # Replace with the desired Ubuntu AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.example_subnet.id

  vpc_security_group_ids = [aws_security_group.instance_sg[count.index].id]

  tags = {
    Name = "ec2-ubuntu-testing-grounds-${count.index}"
  }
}
