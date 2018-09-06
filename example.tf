provider "aws" {
  region     = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }  
}

variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-4b32be2b"
	"eu-west-2" = "ami-78e8fd1c"
  }
}

variable "region" {
  default = "eu-west-2"
}

# London eu-west-2  ami-ed908589 ami-78e8fd1c