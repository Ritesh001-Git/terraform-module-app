resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.env}-${var.bucket_name}"

  tags = {
    NAME = "${var.env}-${var.bucket_name}"
    ENVIRONMENT = var.env
  }
}