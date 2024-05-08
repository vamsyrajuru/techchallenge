provider "aws" {
  region     = var.aws_region  
}

provider "kubernetes" {
#  config_path    = "~/.kube/config"
   config_path    = "~/kubeconfig"
}

## Defining the S3 backend for the state file locking

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         	   = "vamsy-rajuru-terraform-state-file-backend"
    key              	 = "state/terraform.tfstate"
    region         	   = "us-west-2"
    encrypt        	   = true
    dynamodb_table     = "tf_lockid"
  }
}