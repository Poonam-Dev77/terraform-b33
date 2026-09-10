resource "aws_instance" "example" {
    instance_type              = "t3.micro"
    ami                        = "ami-0c6b3b583f6e55a2f"
    key_name                   = "ohio-key"
    count                      = 2
    vpc_security_group_ids     = ["sg-07b0f9fabefeaea2c"]

    provisioner "file" {
        source    = "hello.txt"
        destination = "/home/ec2-user/hello.txt"
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }

  connection {
    type               = "ssh"
    user               = "ec2-user"
    private_key        = file("${path.module}/ohio-key.pem")
    host               = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
        "sudo yum install httpd -y",
        "sudo systemctl start httpd",
        "sudo systemctl enable httpd"
    ]
  }
}