resource "helm_release" "this" {
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  namespace        = var.namespace
  create_namespace = true
  version          = var.chart_version

  set = [{
    name  = "installCRDs"
    value = "true"
  }]
}
