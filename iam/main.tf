provider "aws" {
  region = "us-east-1"
}

# IAM user
resource "aws_iam_user" "myUser" {
  name = "LJ"
}

# Attach the custom policy to the iam user
resource "aws_iam_policy_attachment" "policyBind" {
  name       = "attachment"
  users      = [aws_iam_user.myUser.name]
  policy_arn = aws_iam_policy.custom_policy.arn
}

# Custom policy
resource "aws_iam_policy" "custom_policy" {
  name   = "custom_policy"
  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"ec2:DescribeAddressTransfers",
				"ec2:SearchLocalGatewayRoutes"
			],
			"Resource": "*"
		}
	]
}
EOF
}
