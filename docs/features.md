# Features

## VPC

The VPC module creates public and private subnets across two Availability Zones. Public subnets are tagged for internet-facing load balancers, and private subnets are tagged for internal load balancers.

## EKS Cluster And Managed Node Group

The EKS module creates the control plane, managed node group, node IAM role, and Pod Identity Agent. The node group's desired size is ignored after creation so Cluster Autoscaler can adjust capacity without fighting Terraform state.

## User Access

The `user-access` module demonstrates EKS access entries:

- `developer` maps to Kubernetes group `my-viewer`.
- `manager` can assume an admin role mapped to Kubernetes group `my-admin`.

Apply the RBAC examples before testing those identities:

```bash
kubectl apply -f examples/rbac-developer
kubectl apply -f examples/rbac-admin
```

Uncomment `module "user_access"` in `environments/dev/main.tf` before testing this path.

## Metrics Server And HPA

HPA needs metrics-server to read pod CPU and memory metrics. Uncomment the Helm provider in `environments/dev/providers.tf` and `module "metrics_server"` in `environments/dev/main.tf` before testing this path.

```bash
kubectl apply -f examples/hpa
kubectl get hpa -n hpa-ns
```

## Cluster Autoscaler

Cluster Autoscaler watches for pods that cannot be scheduled and adjusts the managed node group size. The demo deployment requests enough CPU and memory to create scheduling pressure.

Uncomment the Helm provider and `module "cluster_autoscaler"` before testing this path.

```bash
kubectl apply -f examples/cluster-autoscaler
kubectl get pods -n cluster-autoscaler-demo
```

## AWS Load Balancer Controller

The AWS Load Balancer Controller powers:

- `examples/alb-service`: a `LoadBalancer` service backed by an AWS load balancer.
- `examples/alb-ingress`: an ALB ingress.
- `examples/alb-ingress-tls`: ALB TLS termination with an ACM certificate ARN.

Uncomment the Helm provider and `module "aws_load_balancer_controller"` before testing these examples.

## NGINX Ingress And cert-manager

The NGINX ingress controller handles Kubernetes-level routing after traffic reaches its AWS load balancer. The cert-manager example shows how to request certificates through an HTTP-01 challenge.

Replace placeholder hostnames and email addresses before using the TLS examples.

For NGINX ingress, uncomment the Helm provider, AWS Load Balancer Controller, and NGINX ingress modules. For cert-manager TLS, also uncomment `module "cert_manager"`.

## EBS CSI

The EBS CSI module installs the AWS EBS CSI addon and creates a `gp3` StorageClass.

Uncomment the Kubernetes provider and `module "ebs_csi"` before testing this example.

```bash
kubectl apply -f examples/ebs-statefulset
kubectl get pvc -n ebs-ns
```

## EFS CSI

The EFS CSI module creates an encrypted EFS file system, mount targets, the EFS CSI addon, and an `efs` StorageClass.

Uncomment the Kubernetes provider and `module "efs_csi"` before testing this example.

```bash
kubectl apply -f examples/efs-statefulset
kubectl get pvc -n efs-ns
```

## Secrets Store CSI Driver

The Secrets Store CSI module installs the CSI driver and AWS provider. It also creates a demo IAM role for the `myapp` service account in `secrets-ns`.

Create or update the Secrets Manager secret named in `examples/secrets-store-csi/secret-provider-class.yaml` before applying the example.

Uncomment the Helm provider and `module "secrets_store_csi"` before testing this example.
