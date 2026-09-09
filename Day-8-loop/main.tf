resource "aws_instance" "ece" {
    for_each = tomap({
        server-1 = "t3.micro"
        server-2 = "t3.small"
        server-3 = "c7i-flex.large"
    })
    ami = "ami-02159ad7e38d562f2"
    instance_type = each.value
    key_name = "ohio-key"
    tags = {
        Name = each.key
    }
}