output "role_arn" {
  description = "AWS Load Balancer Controller IAM role ARN."
  value       = aws_iam_role.this.arn
}

output "release_name" {
  description = "Helm release name."
  value       = helm_release.this.name
}
