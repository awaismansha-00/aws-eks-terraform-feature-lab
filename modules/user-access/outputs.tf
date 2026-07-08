output "developer_user_arn" {
  description = "Developer IAM user ARN."
  value       = var.create_iam_users ? aws_iam_user.developer[0].arn : null
}

output "manager_user_arn" {
  description = "Manager IAM user ARN."
  value       = var.create_iam_users ? aws_iam_user.manager[0].arn : null
}

output "eks_admin_role_arn" {
  description = "EKS admin role ARN."
  value       = aws_iam_role.eks_admin.arn
}
