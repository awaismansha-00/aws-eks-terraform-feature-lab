variable "cluster_name" {
  description = "EKS cluster name."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID."
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for EFS mount targets."
  type        = list(string)
}

variable "cluster_security_group_id" {
  description = "EKS cluster security group allowed to access EFS."
  type        = string
}

variable "addon_version" {
  description = "AWS EFS CSI Driver addon version."
  type        = string
  default     = "v3.3.0-eksbuild.1"
}

variable "storage_class_name" {
  description = "StorageClass name for EFS volumes."
  type        = string
  default     = "efs"
}
