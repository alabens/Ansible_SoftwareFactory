resource "aws_s3_bucket" "mybucket-c29df123" {
  bucket = "mybucket-c29df123"
  acl    = "public-read"
  force_destroy  = "true"
  policy = "${file("policy.json")}"


  website {
    index_document = "index.html"
    error_document = "error.html"

    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }

  tags = {
    Name = "MyBucket"
  }
}



