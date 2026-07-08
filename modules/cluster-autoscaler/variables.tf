variable "cluster_name" {
  description = "EKS cluster name."
  type        = string
}

variable "aws_region" {
  description = "AWS region."
  type        = string
}

variable "chart_version" {
  description = "Cluster Autoscaler Helm chart version."
  type        = string
  default     = "9.58.0"
}

variable "service_account_name" {
  description = "Kubernetes service account used by Cluster Autoscaler."
  type        = string
  default     = "cluster-autoscaler"
}
