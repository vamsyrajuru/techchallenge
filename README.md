# Terraform template to launch AWS EKS Cluster with the given specifications

<pre>
o Deploy in US West 2 <br>

A variable is passed to set the region to "us-west-2" <br>

aws_region = "us-west-2" <br>


o Cluster name should be your last name  <br>

A variable is passed to set the region to lastname <br>

eks_cluster_name = "rajuru" <br>



o Kubernetes version 1.27  <br>

A variable is passed to set the version to 1.27 <br>

eks_cluster_version = "1.27"  <br>



o Create a unique cluster service role for the cluster  <br>

A unique cluster service role is created for this cluster. The value is passed through the variable <br>

eks_iam_role_name  = "rajuru-eks-cluster-role"  <br>

o Resources created should be tagged  <br>

o OWNER:APPLICANT_LASTNAME_FIRSTINITIAL  <br>
o CATEGORY:ENG_ASSESSMENT  <br>

The resources are tagged as suggested , The values are passed through the variable <br>

  tags = {  <br>
    OWNER = var.owner_tag <br>
    CATEGORY   = var.category_tag <br>
  } <br>

owner_tag = "APPLICANT_RAJURU_V" <br>
category_tag = "ENG_ASSESSMENT" <br>

o Other requirements  <br>
o Node  <br>
    Node group – max size 6, min size 3, desired size 4  <br>
    Nodes should be CPU Optimized  <br>
    Amazon EKS optimized AMI  <br>
    Auto Update  <br>

The node group size values, the instance type, AMI type are all passed to the modules and values are passed through the variables <br>

## EKS Managed Node Group(s) <br>
  eks_managed_node_group_defaults = { <br>

## Nodes should be CPU Optimized <br>
## The Compute nodes are configured for EKS <br>

    compute = { <br>
      instance_types = var.eks_instance_types <br>
    } <br>

## Amazon EKS optimized AMI <br>
## EKS optimized AMI version is set and read from terraform.tfvars <br>

      ami_type = var.eks_ami_type <br>
  }

  eks_managed_node_groups = { <br>
    blue = {} <br>
    green = { <br>

## Node group – max size 6, min size 3, desired size 4 <br>

      min_size     = 3 <br>
      max_size     = 6 <br>
      desired_size = 4 <br>

      instance_types = var.eks_instance_types <br>
      capacity_type  = "SPOT" <br>
    } <br>
  } <br>

eks_ami_type = "AL2_ARM_64"  <br>
lastname_namespace = "rajuru"  <br>
eks_instance_types = ["c7g.medium", "c7g.large"]  <br>

o Namespace  <br>
    Should have at least one namespace - your last name  <br>
o Networking -  <br>
    Private with exception of this CIDR block - 196.182.32.48/32  <br>    

Terraform provisioner and local-exec are used to set context and run aws cli and kubectl commands to create name space and set CIDR restrictions <br>  

resource "null_resource" "update-kubeconfig-create-namespace" { <br>  

  provisioner "local-exec" { <br>  
    command     = "aws eks update-kubeconfig --region ${var.aws_region} --name ${var.eks_cluster_name}" <br>  
  } <br>  

  provisioner "local-exec" { <br>  
    command     = "kubectl create namespace ${var.lastname_namespace}" <br>  
  } <br>  

  depends_on = [ <br>  
    module.eks   <br>  
  ] <br>  
} <br>  


o VPC should be read in from an output  <br>

A vpc_id module is created with logic to read the vpc_id and write to an output. The output vpc_id value is read in the root main.tf  <br>

module "vpc_id" { <br>
  source  = "./vpc_id" <br>
  aws_region = var.aws_region <br>
} <br>

module "eks" { <br>
  source  = "terraform-aws-modules/eks/aws" <br>
  version = "~> 19.0" <br>

  vpc_id                   = module.vpc_id.vpc_id <br>

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
