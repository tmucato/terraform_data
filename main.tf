terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
          
        }
    }

    required_version = "1.3.7"
}

provider "aws" {

region = "us-east-1"
    
}

resource "aws_instance" "angular_server" {
  ami                     = "ami-06e46074ae430fba6"
  instance_type           = "t3.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
    #!/bin/bash
    echo "Hello, World" > index.html
    nohup busybox httpd -f -p 8080 &
    EOF

  tags = {
    Name = "MucasProjectServer"
  }
}

resource "aws_security_group" "instance" {

  name = "MucasProjectServer_SecurityGroup"

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
