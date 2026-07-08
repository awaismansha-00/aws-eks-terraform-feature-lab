variable "chart_version" {
  description = "ingress-nginx Helm chart version."
  type        = string
  default     = "4.15.1"
}

variable "namespace" {
  description = "Namespace for the NGINX ingress controller."
  type        = string
  default     = "ingress"
}

variable "values_file" {
  description = "Optional Helm values file path."
  type        = string
  default     = null
}
