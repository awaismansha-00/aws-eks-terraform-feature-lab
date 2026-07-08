# Troubleshooting

## Terraform Backend Does Not Exist

Run the bootstrap stack first:

```bash
cd bootstrap/backend
terraform init
terraform apply
```

Then run Terraform from `environments/dev`.

The backend bucket region is separate from the EKS cluster region. If Terraform reports an S3 `301` with an actual bucket location, update `environments/dev/backend.tf` and `bootstrap/backend/variables.tf` to match the bucket's real region.

In this lab the intended default region is `eu-west-2` for both the backend and the EKS environment.

## Helm Or Kubernetes Provider Cannot Connect

By default the Helm and Kubernetes provider blocks are commented out. Uncomment them only when enabling optional add-on modules.

On the first deployment, create the foundation first:

```bash
cd environments/dev
terraform apply
```

Then uncomment the provider blocks and optional add-on module you want to test.

## Load Balancer Is Not Created

Check the AWS Load Balancer Controller:

```bash
kubectl get pods -n kube-system | grep load-balancer
kubectl describe ingress -A
kubectl describe svc -A
```

Also confirm subnet tags are present:

```text
kubernetes.io/role/elb = 1
kubernetes.io/role/internal-elb = 1
kubernetes.io/cluster/<cluster-name> = owned
```

## Pods Are Pending

Check requested CPU and memory:

```bash
kubectl describe pod -A
kubectl get nodes
kubectl top nodes
```

For the Cluster Autoscaler example, pending pods are expected briefly while the node group scales.

## HPA Shows Unknown Metrics

Confirm metrics-server is running:

```bash
kubectl get pods -n kube-system | grep metrics-server
kubectl top pods -A
```

## EBS Or EFS PVC Is Pending

Check the CSI driver pods and StorageClasses:

```bash
kubectl get pods -n kube-system | grep csi
kubectl get storageclass
kubectl describe pvc -A
```

EBS uses `ReadWriteOnce`; EFS uses `ReadWriteMany`.

## Secrets Store CSI Example Fails

Check that the secret exists in Secrets Manager and that its ARN is allowed by `secrets_manager_secret_arns`.

```bash
kubectl describe pod -n secrets-ns
kubectl get secretproviderclass -n secrets-ns
```
