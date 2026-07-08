output "cluster_name" {
  description = "EKS cluster name."
  value       = module.eks.cluster_name
}

output "region" {
  description = "AWS region."
  value       = var.region
}

output "vpc_id" {
  description = "VPC ID."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs."
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs."
  value       = module.vpc.private_subnet_ids
}

output "node_group_name" {
  description = "Managed node group name."
  value       = module.eks.node_group_name
}

output "update_kubeconfig_command" {
  description = "Command for configuring kubectl."
  value       = "aws eks update-kubeconfig --region ${var.region} --name ${module.eks.cluster_name}"
}

# Uncomment this output when module.user_access is enabled.
#
# output "developer_user_arn" {
#   description = "Developer demo IAM user ARN."
#   value       = module.user_access.developer_user_arn
# }
#
# output "eks_admin_role_arn" {
#   description = "Admin role ARN for the manager profile."
#   value       = module.user_access.eks_admin_role_arn
# }

# Uncomment this output when module.efs_csi is enabled.
#
# output "efs_file_system_id" {
#   description = "EFS file system ID."
#   value       = module.efs_csi.file_system_id
# }

# Uncomment this output when module.secrets_store_csi is enabled.
#
# output "secrets_store_app_role_arn" {
#   description = "IAM role used by the secrets-store demo workload."
#   value       = module.secrets_store_csi.app_role_arn
# }
