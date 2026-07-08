variable "chart_version" {
  description = "cert-manager Helm chart version."
  type        = string
  default     = "v1.21.0-beta.0"
}

variable "namespace" {
  description = "Namespace for cert-manager."
  type        = string
  default     = "cert-manager"
}
