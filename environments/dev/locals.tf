locals {
  name_prefix  = "${var.environment}-${var.project_name}"
  cluster_name = local.name_prefix
}
