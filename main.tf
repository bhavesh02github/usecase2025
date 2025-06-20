provider "aws" {
  region = "us-east-1"  # Change to your desired region
}
 
resource "aws_iam_role" "example_role" {
  name = "example-iam-role"
 
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}
 
resource "aws_iam_role_policy" "example_policy" {
  name = "example-policy"
  role = aws_iam_role.example_role.id
 
  policy = jsonencode({
    Version = "2012-10-17",
    Statement= [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
  })
}
