# Terraform template to launch AWS EKS Cluster with the given specifications

o Deploy in US West 2
o Cluster name should be your last name
o Kubernetes version 1.27
o Create a unique cluster service role for the cluster
o Resources created should be tagged
o OWNER:APPLICANT_LASTNAME_FIRSTINITIAL
o CATEGORY:ENG_ASSESSMENT
o Other requirements
o Node
    Node group – max size 6, min size 3, desired size 4
    Nodes should be CPU Optimized
    Amazon EKS optimized AMI
    Auto Update
o Namespace
    Should have at least one namespace - your last name
o Networking -
    Private with exception of this CIDR block - 196.182.32.48/32
    
o VPC should be read in from an output

## How to initialize the terraform ?

Run "terraform init"

## How to validate terraform template?

Run "terraform validate"

## How to execute terraform template?

Run "terraform apply"

