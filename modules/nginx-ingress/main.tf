resource "helm_release" "this" {
  name             = "external-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = var.namespace
  create_namespace = true
  version          = var.chart_version

  values = var.values_file == null ? [] : [file(var.values_file)]
}
