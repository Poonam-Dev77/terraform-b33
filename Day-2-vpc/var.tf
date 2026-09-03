variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "public_cidr" {
    default = "10.0.0.0/20"
}

variable "public_az" {
    default = "ap-southeast-1a"
}

variable "private_cidr" {
    default = "10.0.16.0/20"
}

variable "private_az" {
    default = "ap-southeast-1b"
}

variable "ami" {
    default = "ami-02159ad7e38d562f2"
}

variable "instance_type" {
    default = "t3.micro"
}

variable "key_name" {
    default = "ohio-key"
}

variable "volume_size" {
    default = 10
}

variable "volume_type" {
    default = "gp3"
}