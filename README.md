# Terraform multi-account and multi-user AWS Template

The goal of this template is to create universal modules that can be used multiple times for the 
AWS infrastructure with multiple environments. These modules can be found inside the modules directory. In addition, 
the Terraform state can be managed centrally for each environment using the remote backend (S3). 

- Create modules within the modules directory
- Call the module within the infrastructure directory
- Add environments .tfvars-file located in env_vars
- Manage AWS infrastructure by multiple users through remote backend

## Prerequisites

You should have at least two AWS accounts.

Create AWS Roles in each of environment which have deployment privileges to deploy in their
respective accounts. These roles must have "DEPLOY" account's AWS ID as their trusted entity.

- "arn:aws:iam::<YOUR X ACCOUNT ID>:role/Terraform"

## Initial setup

Please note, that the initial setup should only be done the first time the structure is being setup on the AWS "DEPLOY"
account. Once this setup has been completed, it is not necessary to repeat the initial setup.

After you have setup the backend, you can start with the creation and deployments of the infrastructure. All resources
that should be created only on the "DEPLOY" account.

### Setup AWS

Setup all AWS profiles in .aws/config and .aws/credentials 

### Init provider for remote backend 

Go to /terraform-aws-template/terraform/remote-backend/provider.tf and add following attributes:
- AWS region
- profile name of you "DEPLOY" account
- role arn of you "DEPLOY" account

### Init remote backend
- run following commands:
    - cd /terraform-aws-template/terraform/remote-backend
    - terraform init
    - terraform apply
- Copy the output generated as part of terraform apply into a file named backend-config.hcl and save it 
/terraform-aws-template/terraform/infrastructure.chine. This file will act as backend configuration for rest of your 
infrastructure.
- Add profile name from .aws/credentials for you "DEPLOY" account.

### Init remote backend config and environments

- run following commands:
    - cd /terraform-aws-template/terraform/infrastructure
    - terraform init -backend-config=backend-config.hcl
    - terraform workspace new <env-name>

### Init environments

go to /terraform-aws-template/terraform/infrastructure/env_vars and add to <env-name>.tfvars all project and environments required variables

### Deploy

The process for deploying infrastructure for all accounts is the same.

- cd /terraform-aws-template/terraform/infrastructure
- terraform workspace select <env-name>
- terraform plan -var-file="<env-name>.tfvars"
- terraform apply -var-file="<env-name>.tfvars"