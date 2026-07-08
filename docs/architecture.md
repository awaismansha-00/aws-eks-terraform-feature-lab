# Architecture

The lab is split into a Terraform foundation and Kubernetes workload examples.

## Terraform Foundation

The `environments/dev` root module composes these modules:

- `vpc`: Creates a VPC, two public subnets, two private subnets, an internet gateway, a NAT gateway, route tables, and Kubernetes load balancer discovery tags.
- `eks`: Creates the EKS control plane, IAM roles, managed node group, and EKS Pod Identity Agent addon.
- Optional feature modules: Commented module blocks for access, autoscaling, ingress, storage, and secrets examples.

By default, only `vpc` and `eks` are active. Uncomment optional modules in `environments/dev/main.tf` when testing their matching example folders.

## Traffic Flow

- ALB examples use the AWS Load Balancer Controller with `Ingress` resources.
- NGINX ingress is exposed through a Network Load Balancer created for the ingress-nginx controller service.
- cert-manager can issue certificates through HTTP-01 challenges using the NGINX ingress class.

These traffic features require their optional modules to be uncommented before applying the Kubernetes examples.

## Storage Flow

- EBS CSI provisions `ReadWriteOnce` block volumes through the `gp3` StorageClass.
- EFS CSI provisions `ReadWriteMany` file storage through the `efs` StorageClass.

## Identity Flow

The lab uses EKS Pod Identity for add-on and workload permissions. Each controller that needs AWS API access gets an IAM role and an `aws_eks_pod_identity_association`.

The access and add-on identity modules are optional, so enable only the feature path you are testing.
