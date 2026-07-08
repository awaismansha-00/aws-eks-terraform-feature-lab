variable "project_name" {
  description = "Project name used in resource names."
  type        = string
  default     = "eks-cluster"
}

variable "environment" {
  description = "Environment name."
  type        = string
  default     = "dev"
}

variable "region" {
  description = "AWS region."
  type        = string
  default     = "eu-west-2"
}

variable "availability_zones" {
  description = "Availability zones used by the lab."
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"]
}

variable "vpc_cidr" {
  description = "VPC CIDR block."
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDR blocks."
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks."
  type        = list(string)
  default     = ["10.0.2.0/24", "10.0.3.0/24"]
}

variable "eks_version" {
  description = "EKS Kubernetes version."
  type        = string
  default     = "1.36"
}

variable "node_group_instance_types" {
  description = "Managed node group instance types."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_group_capacity_type" {
  description = "Managed node group capacity type."
  type        = string
  default     = "ON_DEMAND"
}

variable "node_group_desired_size" {
  description = "Desired node count."
  type        = number
  default     = 1
}

variable "node_group_min_size" {
  description = "Minimum node count."
  type        = number
  default     = 0
}

variable "node_group_max_size" {
  description = "Maximum node count."
  type        = number
  default     = 3
}

variable "create_demo_iam_users" {
  description = "Create demo IAM users for developer and manager access."
  type        = bool
  default     = true
}

variable "secrets_manager_secret_arns" {
  description = "Secrets Manager ARNs the secrets-store example may read."
  type        = list(string)
  default     = ["*"]
}
