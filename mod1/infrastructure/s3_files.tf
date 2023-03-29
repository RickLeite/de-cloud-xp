
resource "aws_s3_object" "job_spark" {
  bucket = aws_s3_bucket.dl-pipe.id
  key    = "emr-code/pyspark/job_spark_from_tf.py"
  acl    = "private"
  source = "../job_spark.py"
  etag   = filemd5("../job_spark.py")
}
