# ----------------------------
# Core infrastructure
# Always leave these enabled.
# ----------------------------

module "vpc" {
  source = "../../modules/vpc"

  name_prefix          = local.name_prefix
  cluster_name         = local.cluster_name
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "eks" {
  source = "../../modules/eks"

  cluster_name              = local.cluster_name
  eks_version               = var.eks_version
  private_subnet_ids        = module.vpc.private_subnet_ids
  node_group_instance_types = var.node_group_instance_types
  node_group_capacity_type  = var.node_group_capacity_type
  node_group_desired_size   = var.node_group_desired_size
  node_group_min_size       = var.node_group_min_size
  node_group_max_size       = var.node_group_max_size
}

# ----------------------------
# Optional: user access
# Uncomment this to create demo developer/manager IAM access and then apply
# examples/rbac-developer and examples/rbac-admin.
# ----------------------------

# module "user_access" {
#   source = "../../modules/user-access"
#
#   cluster_name     = module.eks.cluster_name
#   create_iam_users = var.create_demo_iam_users
#
#   depends_on = [module.eks]
# }

# ----------------------------
# Optional: metrics-server
# Uncomment the Helm provider in providers.tf, then uncomment this before
# testing examples/hpa.
# ----------------------------

# module "metrics_server" {
#   source = "../../modules/metrics-server"
#
#   values_file = "${path.root}/../../values/metrics-server-values.yaml"
#
#   depends_on = [module.eks]
# }

# ----------------------------
# Optional: cluster autoscaler
# Uncomment the Helm provider in providers.tf, then uncomment this before
# testing examples/cluster-autoscaler.
# ----------------------------

# module "cluster_autoscaler" {
#   source = "../../modules/cluster-autoscaler"
#
#   cluster_name = module.eks.cluster_name
#   aws_region   = var.region
#
#   depends_on = [module.eks]
# }

# ----------------------------
# Optional: AWS Load Balancer Controller
# Uncomment the Helm provider in providers.tf, then uncomment this before
# testing examples/alb-*.
# ----------------------------

# module "aws_load_balancer_controller" {
#   source = "../../modules/aws-load-balancer-controller"
#
#   cluster_name     = module.eks.cluster_name
#   policy_json_path = "${path.root}/../../values/aws-load-balancer-controller-policy.json"
#
#   depends_on = [module.eks]
# }

# ----------------------------
# Optional: NGINX ingress
# Uncomment the Helm provider in providers.tf, then uncomment this and
# aws_load_balancer_controller before testing examples/nginx-ingress.
# ----------------------------

# module "nginx_ingress" {
#   source = "../../modules/nginx-ingress"
#
#   values_file = "${path.root}/../../values/nginx-ingress-values.yaml"
#
#   depends_on = [module.aws_load_balancer_controller]
# }

# ----------------------------
# Optional: cert-manager
# Uncomment the Helm provider in providers.tf, then uncomment this,
# aws_load_balancer_controller, and nginx_ingress before testing
# examples/nginx-ingress-cert-manager.
# ----------------------------

# module "cert_manager" {
#   source = "../../modules/cert-manager"
#
#   depends_on = [module.nginx_ingress]
# }

# ----------------------------
# Optional: EBS CSI
# Uncomment the Kubernetes provider in providers.tf, then uncomment this before
# testing examples/ebs-statefulset.
# ----------------------------

# module "ebs_csi" {
#   source = "../../modules/ebs-csi"
#
#   cluster_name = module.eks.cluster_name
#
#   depends_on = [module.eks]
# }

# ----------------------------
# Optional: EFS CSI
# Uncomment the Kubernetes provider in providers.tf, then uncomment this before
# testing examples/efs-statefulset.
# ----------------------------

# module "efs_csi" {
#   source = "../../modules/efs-csi"
#
#   cluster_name              = module.eks.cluster_name
#   vpc_id                    = module.vpc.vpc_id
#   private_subnet_ids        = module.vpc.private_subnet_ids
#   cluster_security_group_id = module.eks.cluster_security_group_id
#
#   depends_on = [module.eks]
# }

# ----------------------------
# Optional: Secrets Store CSI
# Uncomment the Helm provider in providers.tf, then uncomment this before
# testing examples/secrets-store-csi.
# ----------------------------

# module "secrets_store_csi" {
#   source = "../../modules/secrets-store-csi"
#
#   cluster_name = module.eks.cluster_name
#   aws_region   = var.region
#   secret_arns  = var.secrets_manager_secret_arns
#
#   depends_on = [module.eks]
# }
