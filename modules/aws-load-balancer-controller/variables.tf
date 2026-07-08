variable "cluster_name" {
  description = "EKS cluster name."
  type        = string
}

variable "policy_json_path" {
  description = "Path to the AWS Load Balancer Controller IAM policy JSON."
  type        = string
}

variable "chart_version" {
  description = "AWS Load Balancer Controller Helm chart version."
  type        = string
  default     = "3.4.1"
}

variable "service_account_name" {
  description = "Kubernetes service account used by the controller."
  type        = string
  default     = "aws-load-balancer-controller"
}
