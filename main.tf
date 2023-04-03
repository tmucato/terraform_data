terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
        }
    }

    required_version = "1.3.7"
}

provider "aws" {
    region =  "eu-south-1"
}

resource "aws_instance" "angular_server" {
  
ami = "ami-"
instance_type = "t2.micro"


}
