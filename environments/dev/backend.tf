terraform {
  backend "s3" {
    bucket         = "demo-terraform-eks-state-s3-bucket"
    key            = "eks-lab/dev/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-eks-state-locks"
    encrypt        = true
  }
}
