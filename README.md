# Terraform template to launch AWS EKS Cluster with the given specifications

<pre>
o Deploy in US West 2 <br>
o Cluster name should be your last name  <br>
o Kubernetes version 1.27  <br>
o Create a unique cluster service role for the cluster  <br>
o Resources created should be tagged  <br>
o OWNER:APPLICANT_LASTNAME_FIRSTINITIAL  <br>
o CATEGORY:ENG_ASSESSMENT  <br>
o Other requirements  <br>
o Node  <br>
    Node group – max size 6, min size 3, desired size 4  <br>
    Nodes should be CPU Optimized  <br>
    Amazon EKS optimized AMI  <br>
    Auto Update  <br>
o Namespace  <br>
    Should have at least one namespace - your last name  <br>
o Networking -  <br>
    Private with exception of this CIDR block - 196.182.32.48/32  <br>    
o VPC should be read in from an output  <br>
</pre>

## github actions are enabled to run the workflow everytime a change is pushed to main branch

terraform_execution_workflow.yaml

## How to initialize the terraform ?

Run "terraform init"

## How to validate terraform template?

Run "terraform validate"

## How to execute terraform template?

Run "terraform apply"

## How to destroy terraform project?

Run "terraform destroy"
