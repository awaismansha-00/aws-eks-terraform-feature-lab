variable "cluster_name" {
  description = "EKS cluster name."
  type        = string
}

variable "addon_version" {
  description = "AWS EBS CSI Driver addon version."
  type        = string
  default     = "v1.62.0-eksbuild.1"
}

variable "storage_class_name" {
  description = "StorageClass name for EBS volumes."
  type        = string
  default     = "gp3"
}

variable "create_storage_class" {
  description = "Create a gp3 StorageClass."
  type        = bool
  default     = true
}
