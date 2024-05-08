provider "aws" {
#  profile    = "cred_proc"
  access_key = "AKIAQ65NV2O5CBXEEYWD"
  secret_key = "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"
  region     = var.aws_region
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
}