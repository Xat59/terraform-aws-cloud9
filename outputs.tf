output "id" {
  value = aws_cloud9_environment_ec2.this.id
}

output "arn" {
  value = aws_cloud9_environment_ec2.this.arn
}

output "type" {
  value = aws_cloud9_environment_ec2.this.type
}

output "cloud9_users" {
  value = module.iam_user_cloud9[*]
}