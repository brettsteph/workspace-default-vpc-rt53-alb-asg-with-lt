# # Create an IAM role for the Web Server.
# resource "aws_iam_role" "ec2-assume-role" {
#   name = "ec2-assume-role"

#   # Terraform's "jsonencode" function converts a
#   # Terraform expression result to valid JSON syntax.
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Sid    = ""
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       },
#     ]
#   })
# }
# # # AWS managed policy
# # data "aws_iam_policy" "ReadOnlyAccess" {
# #   arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
# # }
# resource "aws_iam_policy" "inline-policy" {
#   name        = "inline-policy"
#   description = "An inline policy to read-only for s3"

#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Sid": "stmt1",
#       "Action": [
#         "s3:ListBucket"
#       ],
#       "Effect": "Allow",
#       "Resource": "arn:aws:s3:::${var.s3-bucket-name}"
#     },
#     {
#       "Sid": "stmt2",
#       "Action": [
#         "s3:GetObject",
#         "s3:GetObjectVersion"
#       ],
#       "Effect": "Allow",
#       "Resource": "arn:aws:s3:::${var.s3-bucket-name}/*"
#     }
#   ]
# }
# EOF
# }

# resource "aws_iam_role_policy_attachment" "test-attach" {
#   role = aws_iam_role.ec2-assume-role.name
#   # policy_arn = data.aws_iam_policy.ReadOnlyAccess.arn
#   policy_arn = aws_iam_policy.inline-policy.arn
# }

# resource "aws_iam_instance_profile" "ec2-iam-profile" {
#   name = "ec2-iam-profile"
#   role = aws_iam_role.ec2-assume-role.id
# }
