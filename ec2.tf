resource "aws_instance" "myec2" {
  ami                    = "ami-0ce2cb35386fc22e9"
  instance_type          = "t2.medium"
  availability_zone      = "us-west-1b"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name               = "youtubekey"

  tags = {
    name = "Terraform-ansible"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"  # Change to appropriate user for your AMI
    private_key = file("C:/Users/admin/Downloads/youtubekey.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /etc/ansible",
      "sudo sh -c 'echo ${self.public_ip} >> /etc/ansible/hosts'"
    ]
  }
}
