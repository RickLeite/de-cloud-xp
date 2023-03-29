provider "aws" {
  region = var.aws_region
}

# Centralizar o arquivo de controle de estado do Terraform

terraform {
  backend "s3" {
    bucket = "terraform-state-igti-pat"
    key    = "state/igti/edc/terraform.tfstate"
    region = "us-east-2"
  }
}
