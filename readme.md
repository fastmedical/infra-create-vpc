# AWS VPC Terraform Configuration

A simple modular Terraform script to create an AWS Virtual Private Cloud (VPC) with or without Network Address Translation (NAT).

## Prerequisites

- Install [Terraform](https://www.terraform.io/downloads.html) (v0.12.0 or later).
- Set up AWS credentials on your local machine.

## AWS Provider

The AWS provider is declared at the beginning of the `main.tf` file. This is required for Terraform to interact with AWS resources. The `region` parameter is set to `"us-east-2"`, but you can change this to the AWS region that you wish to use.

## Infrastructure Modules

There are two modules provided in this configuration: `with_nat` and `without_nat`. They are designed to set up VPCs with and without NAT gateways, respectively. 

The `with_nat` module is currently commented out, but you can uncomment it if you wish to use it.

The `without_nat` module is currently active. 

Both modules use the following parameters:

- `source`: This is the path to the module's configuration files.
- `vpc_cidr_block`: The CIDR block for the VPC.
- `public_subnet_a_cidr_block` and `public_subnet_b_cidr_block`: The CIDR blocks for the public subnets.
- `private_subnet_a_cidr_block` and `private_subnet_b_cidr_block`: The CIDR blocks for the private subnets.

## Usage

1. Clone this repository to your local machine.
2. Change the AWS `region` in `main.tf` if necessary.
3. Uncomment the `with_nat` module in `main.tf` if you wish to use it and comment the `without_nat` module.
4. Run `terraform init` to initialize your Terraform workspace.
5. Run `terraform plan` to see what changes will be made.
6. Run `terraform apply` to apply the changes to your AWS account.

## Note

Ensure that the CIDR blocks provided do not overlap with any existing networks you have in your AWS environment, as this may cause errors when creating the VPCs and subnets.

Always review the plan from `terraform plan` before running `terraform apply` to understand what changes will be made to your infrastructure.

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.