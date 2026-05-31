terraform {
  backend "s3" {
    bucket = "project-bedrock-tf-state-koke001"
    key    = "global/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
