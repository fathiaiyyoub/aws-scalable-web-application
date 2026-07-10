resource "aws_iam_policy" "s3_arr_policy" {
  name        = "S3-ARR-Policy"
  description = "Allow EC2 instances to read website files from S3"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject"
        ]
        Resource = [
          "arn:aws:s3:::arr-bucket-fathi-2026/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role" "s3_arr_role" {
  name = "S3-ARR-Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_s3_policy" {
  role       = aws_iam_role.s3_arr_role.name
  policy_arn = aws_iam_policy.s3_arr_policy.arn
}

resource "aws_iam_instance_profile" "s3_arr_profile" {
  name = "S3-ARR-Role"
  role = aws_iam_role.s3_arr_role.name
}