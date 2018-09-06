provider "aws" {
  region     = "eu-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-78e8fd1c"
  instance_type = "t2.micro"
  
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }  
}


# London eu-west-2  ami-ed908589 ami-78e8fd1c