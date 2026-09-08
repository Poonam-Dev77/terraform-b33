# Create S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-terraform-demo-bucket-12345"

  tags = {
    Name        = "Terraform Demo Bucket"
    Environment = "dev"
  }
}

# Upload a file to the S3 bucket
resource "aws_s3_object" "example_file" {
  bucket = aws_s3_bucket.my_bucket.id

  key    = "example.txt"
  source = "${path.module}/files/example.txt"

  etag = filemd5("${path.module}/files/example.txt")
}