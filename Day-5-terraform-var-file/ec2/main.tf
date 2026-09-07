resource "aws_instance" "Public_instance" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = var.public_subnet_id
    vpc_security_group_ids = [var.sg_id]
    associate_public_ip_address = true
    user_data = file("/root/terraform-b33/Day-5-terraform-var-file/ec2/user_data.sh")
    tags = {
        Name = "public_instance"
    }
}

resource "aws_instance" "Private_instance" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = var.private_subnet_id
    vpc_security_group_ids = [var.sg_id]
    associate_public_ip_address = false
    user_data = file("/root/terraform-b33/Day-5-terraform-var-file/ec2/user_data.sh")
    tags = {
        Name = "private_instance"
    }
}