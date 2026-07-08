output "role_arn" {
  description = "EBS CSI IAM role ARN."
  value       = aws_iam_role.this.arn
}

output "storage_class_name" {
  description = "EBS StorageClass name."
  value       = var.storage_class_name
}
