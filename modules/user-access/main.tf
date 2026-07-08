data "aws_caller_identity" "current" {}

resource "aws_iam_user" "developer" {
  count = var.create_iam_users ? 1 : 0

  name = var.developer_username
}

resource "aws_iam_policy" "developer_eks" {
  name = "${var.cluster_name}-developer-eks-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "eks:DescribeCluster",
        "eks:ListClusters"
      ]
      Resource = "*"
    }]
  })
}

resource "aws_iam_user_policy_attachment" "developer_eks" {
  count = var.create_iam_users ? 1 : 0

  user       = aws_iam_user.developer[0].name
  policy_arn = aws_iam_policy.developer_eks.arn
}

resource "aws_eks_access_entry" "developer" {
  count = var.create_iam_users ? 1 : 0

  cluster_name      = var.cluster_name
  principal_arn     = aws_iam_user.developer[0].arn
  kubernetes_groups = [var.viewer_group]
}

resource "aws_iam_role" "eks_admin" {
  name = "${var.cluster_name}-eks-admin"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "eks_admin" {
  name = "${var.cluster_name}-admin-eks-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["eks:*"]
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = ["iam:PassRole"]
        Resource = "*"
        Condition = {
          StringEquals = {
            "iam:PassedToService" = "eks.amazonaws.com"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_admin" {
  role       = aws_iam_role.eks_admin.name
  policy_arn = aws_iam_policy.eks_admin.arn
}

resource "aws_iam_user" "manager" {
  count = var.create_iam_users ? 1 : 0

  name = var.manager_username
}

resource "aws_iam_policy" "eks_assume_admin" {
  name = "${var.cluster_name}-assume-admin-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = "sts:AssumeRole"
      Resource = aws_iam_role.eks_admin.arn
    }]
  })
}

resource "aws_iam_user_policy_attachment" "manager_assume_admin" {
  count = var.create_iam_users ? 1 : 0

  user       = aws_iam_user.manager[0].name
  policy_arn = aws_iam_policy.eks_assume_admin.arn
}

resource "aws_eks_access_entry" "manager_admin" {
  cluster_name      = var.cluster_name
  principal_arn     = aws_iam_role.eks_admin.arn
  kubernetes_groups = [var.admin_group]
}
