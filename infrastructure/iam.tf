resource "aws_iam_role" "lambda" {
  name = "IGTILambdaRole"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "Service" : "lambda.amazonaws.com"
        },
        "Effect" : "Allow",
        "Sid" : "AssumeRole"
      }
    ]
  })


  tags = {
    IES   = "IGTI"
    CURSO = "EDC"
  }

}


resource "aws_iam_policy" "lambda" {
  name        = "IGTIAWSLambdaBasicExecutionRolePolicy"
  path        = "/"
  description = "Provides write permission to CloudWatch Logs, S3 buckets, and EMR steps"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "s3:*",
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "elasticmapreduce:*",
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "iam:PassRole",
        "Resource" : "*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "lambda_attach" {
  role       = aws_iam_role.lambda.name
  policy_arn = aws_iam_policy.lambda.arn
}
