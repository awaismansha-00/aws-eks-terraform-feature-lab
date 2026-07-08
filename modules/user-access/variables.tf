variable "cluster_name" {
  description = "EKS cluster name."
  type        = string
}

variable "developer_username" {
  description = "IAM user name for read-only developer access."
  type        = string
  default     = "developer"
}

variable "manager_username" {
  description = "IAM user name allowed to assume the EKS admin role."
  type        = string
  default     = "manager"
}

variable "viewer_group" {
  description = "Kubernetes group mapped to the developer access entry."
  type        = string
  default     = "my-viewer"
}

variable "admin_group" {
  description = "Kubernetes group mapped to the admin access entry."
  type        = string
  default     = "my-admin"
}

variable "create_iam_users" {
  description = "Create demo IAM users for developer and manager access."
  type        = bool
  default     = true
}
