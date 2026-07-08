terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.44.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "3.1.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.1.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# Uncomment these data sources and providers before enabling any optional module
# that installs Helm charts or creates Kubernetes resources.
#
# data "aws_eks_cluster" "this" {
#   name = module.eks.cluster_name
# }
#
# data "aws_eks_cluster_auth" "this" {
#   name = module.eks.cluster_name
# }
#
# provider "helm" {
#   kubernetes = {
#     host                   = data.aws_eks_cluster.this.endpoint
#     cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
#     token                  = data.aws_eks_cluster_auth.this.token
#   }
# }
#
# provider "kubernetes" {
#   host                   = data.aws_eks_cluster.this.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
#   token                  = data.aws_eks_cluster_auth.this.token
# }
