
resource "aws_s3_bucket" "dl-pipe" {

  bucket = "datalake-patrz-igti-edc-tf"

  tags = {
    IES   = "IGTI"
    CURSO = "EDC"
  }

}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.dl-pipe.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "datalake-encript" {
  bucket = aws_s3_bucket.dl-pipe.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }

  }

}
