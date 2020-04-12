resource "aws_s3_bucket" "mybucket-c29df123" {
  bucket = "mybucket-c29df123"
  acl    = "public"
  force_destroy  = "true"

  tags = {
    Name = "MyBucket"
  }
}



