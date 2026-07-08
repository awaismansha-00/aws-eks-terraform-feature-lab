variable "region" {
  description = "AWS region for the Terraform state backend."
  type        = string
  default     = "eu-west-2"
}

variable "state_bucket_name" {
  description = "S3 bucket name for Terraform state."
  type        = string
  default     = "demo-terraform-eks-state-s3-bucket"
}

variable "lock_table_name" {
  description = "DynamoDB table name for Terraform state locking."
  type        = string
  default     = "terraform-eks-state-locks"
}
