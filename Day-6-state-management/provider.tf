provider "aws" {
    region = "ap-southeast-1"
    profile = "dev"
}

terraform {
  backend "s3" {
    bucket = "deploywithpoonam.space1"
    region = "ap-southeast-1"
    profile = "dev"
    use_lockfile = "true"
    key = "terraform.tfstate"
    shared_credentials_files = ["/root/.aws/credentials"]
  }
}