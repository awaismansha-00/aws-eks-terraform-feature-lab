output "release_name" {
  description = "Helm release name."
  value       = helm_release.this.name
}

output "ingress_class_name" {
  description = "Ingress class name configured by the included values file."
  value       = "external-nginx"
}
