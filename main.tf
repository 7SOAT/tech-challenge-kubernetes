terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
      }
    }

    backend "s3" {
      bucket         = "afluga-kubernetes-terraform-backend"
      key            = "env/dev/infra/terraform.tfstate"
      region         = "us-east-1"      
      encrypt        = true
    }
}