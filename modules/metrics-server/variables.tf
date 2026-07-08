variable "chart_version" {
  description = "metrics-server Helm chart version."
  type        = string
  default     = "3.13.1"
}

variable "values_file" {
  description = "Optional Helm values file path."
  type        = string
  default     = null
}
