
provider "aws" {
  version = ">= 2.28.1"
  region  = var.region
}

data "aws_caller_identity" "current" {}


resource "aws_iam_role_policy" "DataAccessPolicyForS3" {
  name ="DataAccessPolicyForS3"
  role = aws_iam_role.DataLakeWorkflowRole.id

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
        "Resource": ["arn:aws:s3:::${var.s3bucket_name}/*"
        ]
      },
      {
        "Effect": "Allow",
        "Action": [
          "s3:ListBucket"
        ],
        "Resource": ["arn:aws:s3:::${var.s3bucket_name}"
        ]
      }
    ]
  })
}
