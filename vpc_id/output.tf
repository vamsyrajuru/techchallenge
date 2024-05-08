## Write the VPC ID value to an output variable. This variable is read in main template

output "vpc_id" {
  value = data.aws_vpc.default.id
}