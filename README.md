# Terraform proof of concept

This repo is a terraform proof of concept to work with terraform and build a VPC
with subnets and EC2 instances in AWS.

The project is splitted into 3 branches, each branch is an iteration of the
project.

- The first step is to set the project and the base components of it (master)
- The modularity folder structure is made in the (day2)
- The final components and structure live in the (final) branch

## Final project structure

```zsh
.
├── ec2.tf
├── jorgechato
│   └── eu-west-1
│       └── dev
│           ├── network.tf
│           ├── provider.tf
│           ├── remote_source.tf
│           ├── variables.tf
│           └── variables.tfvars
├── modules
│   └── vpc
│       ├── outputs.tf
│       ├── variables.tf
│       └── vpc.tf
└── provider.tf
```
