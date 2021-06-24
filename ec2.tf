resource "aws_instance" "My_instance" {
  ami           = "ami-038f1ca1bd58a5790"
  instance_type = "t2.micro"

  tags = {
    Name = "Myinstance"
  }
}