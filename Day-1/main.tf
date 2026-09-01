resource "aws_instance" "ec2" {
   ami= "ami-0532913178263be11"  
   instance_type = "t3.micro"
   key_name = "ohio_key"
   vpc_security_group_ids = ["sg-0c447262392a165d4"]
   tags = {
      Name = "my_ec2"
   }
}