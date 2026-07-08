variable "cluster_name" {
  description = "EKS cluster name."
  type        = string
}

variable "aws_region" {
  description = "AWS region used by the example SecretProviderClass."
  type        = string
}

variable "secret_arns" {
  description = "Secrets Manager ARNs the demo workload may read."
  type        = list(string)
  default     = ["*"]
}

variable "app_namespace" {
  description = "Namespace for the demo app pod identity association."
  type        = string
  default     = "secrets-ns"
}

variable "app_service_account" {
  description = "Service account for the demo app pod identity association."
  type        = string
  default     = "myapp"
}

variable "driver_chart_version" {
  description = "Secrets Store CSI Driver Helm chart version."
  type        = string
  default     = "1.6.3"
}

variable "aws_provider_chart_version" {
  description = "AWS provider for Secrets Store CSI Driver Helm chart version."
  type        = string
  default     = "3.1.1"
}
