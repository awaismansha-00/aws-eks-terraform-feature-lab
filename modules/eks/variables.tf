variable "cluster_name" {
  description = "EKS cluster name."
  type        = string
}

variable "eks_version" {
  description = "EKS Kubernetes version."
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for the EKS cluster and managed node group."
  type        = list(string)
}

variable "node_group_instance_types" {
  description = "EC2 instance types for the managed node group."
  type        = list(string)
}

variable "node_group_capacity_type" {
  description = "Managed node group capacity type."
  type        = string
}

variable "node_group_desired_size" {
  description = "Desired node count."
  type        = number
}

variable "node_group_min_size" {
  description = "Minimum node count."
  type        = number
}

variable "node_group_max_size" {
  description = "Maximum node count."
  type        = number
}

variable "pod_identity_agent_version" {
  description = "EKS Pod Identity Agent addon version."
  type        = string
  default     = null
}
