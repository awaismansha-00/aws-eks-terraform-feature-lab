output "app_role_arn" {
  description = "IAM role ARN used by the secrets-store demo app."
  value       = aws_iam_role.app.arn
}

output "driver_release_name" {
  description = "Secrets Store CSI Driver Helm release name."
  value       = helm_release.driver.name
}
