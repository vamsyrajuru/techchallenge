provider "aws" {
#  profile    = "cred_proc"
  region     = var.aws_region
  
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
}