output "file_system_id" {
  description = "EFS file system ID."
  value       = aws_efs_file_system.this.id
}

output "role_arn" {
  description = "EFS CSI IAM role ARN."
  value       = aws_iam_role.this.arn
}

output "storage_class_name" {
  description = "EFS StorageClass name."
  value       = var.storage_class_name
}
