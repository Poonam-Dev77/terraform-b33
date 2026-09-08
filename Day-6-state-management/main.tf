resource "aws_instance" "public_instance" {
    ami = "ami-02159ad7e38d562f2"
    instance_type = "t3.micro"
    key_name = "ohio-key"
    count = 2
    vpc_security_group_ids =["sg-07b0f9fabefeaea2c"]
    tags = {
        Name = "public_instance"
    }
}