resource "aws_instance" "My_web_app" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  security_groups = [ "default" ]

  tags = {
    Name = "${var.ec2_name}"
  }
  availability_zone = "${var.availability_zone}"
}