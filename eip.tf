resource "aws_eip" "My_eip" {
  instance = "${aws_instance.My_instance.id}"
  vpc      = true
}
output "my_eip" {
  value = "${aws_eip.My_eip.public_ip}"
}