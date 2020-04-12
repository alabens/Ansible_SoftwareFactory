resource "aws_s3_bucket" "mybucket-c29df123" {
  bucket = "mybucket-c29df123"
  acl    = "private"
  force_destroy  = "true"

  tags = {
    Name = "MyBucket"
  }
}



