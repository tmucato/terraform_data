terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
        
        }
    }

    required_version = "1.3.7"
}

provider "aws" {}

resource "aws_instance" "angular_server" {
  
ami = "ami-0c55b159cbfafe10"
instance_type = "t2.micro"


}
