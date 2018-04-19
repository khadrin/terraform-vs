variable "name" {}

resource "aws_s3_bucket" "bucket" {
  #description = "created by terraform"
  bucket = "${var.name}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
      }
    }
  }

  versioning = {
    enabled = "true"
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  #description = "created by terraform"
  bucket = "${aws_s3_bucket.bucket.id}"
  policy =<<POLICY
{
  "Version": "2012-10-17",
  "Id": "${var.name} policy",
  "Statement": [
    {
      "Action": "s3:*",
      "Effect":"Deny",
      "Principal": "*",
      "Resource":"arn:aws:s3:::${var.name}/*",
      "Condition":{
        "Bool":
        { "aws:SecureTransport": "false" }
      }
    }
  ]
}
POLICY
}
