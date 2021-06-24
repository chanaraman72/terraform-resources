    resource "aws_instance" "My_instance" {
      ami           = "ami-038f1ca1bd58a5790"
      instance_type = "t2.micro"
      key_name = "chan"

      tags = {
        Name = "Myinstance"
      }
        provisioner "local-exec" {
            
        command = "echo ${aws_instance.My_instance.private_ip} >> private_ip.txt" 
    }
    }
    resource "aws_eip" "My_eip" {
      instance = "${aws_instance.My_instance.id}"
      vpc      = true
    }
    output "my_eip" {
      value = "${aws_eip.My_eip.public_ip}"
    }

    resource "null_resource" "ec2-ssh-connection" {
        connection {
              host        = "${aws_eip.My_eip.public_ip}"
              type        = "ssh"
              port        = 22
              user        = "ec2-user"
              private_key = "${file("/home/chan/Desktop/AWS/chan.pem")}"
              timeout     = "3m"
              agent       = false
            }
        provisioner "file" {
            # cp index.html ec2-user@eip:/var/index.html
            source      = "index.html"
            destination = "/home/ec2-user/index.html"
          }
        provisioner "remote-exec" {
              inline = [
              "sudo yum update -y",
              "sudo yum install -y httpd",
              "sudo systemctl start httpd.service",
              "sudo systemctl enable httpd.service",
              "sudo cp /home/ec2-user/index.html /var/www/html/index.html",
          ]
          }
    }

    # remote_exec