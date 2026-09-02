variable "ami" {
    default = "ami-02159ad7e38d562f2"
  }

  variable "instance_type" {
    default = "t3.micro"
  }

  variable "key_name" {
    default = "ohio_key"
  }

  variable "volume_size" {
    default = 10
  }

  variable "volume_type" {
    default = "gp3"
  }