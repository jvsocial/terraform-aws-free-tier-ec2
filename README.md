# Terraform AWS Free-Tier EC2 Module

This Terraform module creates a free-tier eligible `t2.micro` EC2 instance on AWS. It is designed for reusability across different projects while ensuring compliance with AWS Free Tier limits.

## Table of Contents

- [Usage](#usage)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Requirements](#requirements)
- [Important Notes](#important-notes)
- [License](#license)

## Usage

### Step 1: Define AWS Provider

In your project directory, create a file called `provider.tf` with the following contents to set up the AWS provider:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  required_version = ">= 0.12"
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  token      = var.aws_token
}
```

### Step 2: Define Variables

In your project directory, create a `terraform.tfvars` file with the following contents to specify your AWS credentials and region:

```hcl
aws_access_key = "YOUR_AWS_ACCESS_KEY"
aws_secret_key = "YOUR_AWS_SECRET_KEY"
aws_token      = "YOUR_AWS_SESSION_TOKEN"
aws_region     = "us-east-1"
```

### Step 3: Use the Module

In your `main.tf`, call the module as follows:

```hcl
module "ec2_instance" {
  source = "git::https://github.com/yourusername/terraform-aws-free-tier-ec2.git"
}
```

### Step 4: Initialize and Apply

Run the following commands to initialize and apply your configuration:

```bash
terraform init
terraform apply
```

## Inputs

| Name           | Description                        | Type   | Required |
| -------------- | ---------------------------------- | ------ | -------- |
| aws_access_key | AWS access key for authentication  | string | yes      |
| aws_secret_key | AWS secret key for authentication  | string | yes      |
| aws_token      | Session token for temporary access | string | yes      |
| aws_region     | AWS region to deploy resources     | string | yes      |

## Outputs

| Name        | Description                       |
| ----------- | --------------------------------- |
| instance_id | ID of the EC2 instance            |
| public_ip   | Public IP address of the instance |
| public_dns  | Public DNS of the instance        |

## Requirements

- **Terraform** 0.12 or later
- **AWS Provider** 3.0 or later

## Important Notes

- This module provisions a `t2.micro` EC2 instance, which is eligible for the AWS Free Tier. Be mindful of AWS resource limits when deploying additional workloads.
- Ensure that your AWS credentials are configured properly for Terraform to interact with your AWS account.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
