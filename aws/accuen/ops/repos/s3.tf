resource "aws_s3_bucket" "artifacts" {
  bucket = "com.annalect.build.artifacts"
  acl    = "private"

  tags = {
    Name        = "build_artifacts"
    Environment = "${var.env}"
  }
}
