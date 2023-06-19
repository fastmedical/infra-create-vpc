provider "aws" {
  region = "us-east-2"  # Change this to the AWS region you want
}

# module "with_nat" {
#   source                  = "./modules/with_nat"
#   vpc_cidr_block          = "10.0.0.0/16"
#   public_subnet_a_cidr_block = "10.0.0.0/20"
#   public_subnet_b_cidr_block = "10.0.16.0/20"
#   private_subnet_a_cidr_block = "10.0.32.0/20"
#   private_subnet_b_cidr_block = "10.0.48.0/20"
# }

module "without_nat" {
  source                  = "./modules/without_nat"
  vpc_cidr_block          = "10.0.0.0/16"
  public_subnet_a_cidr_block = "10.0.0.0/20"
  public_subnet_b_cidr_block = "10.0.16.0/20"
  private_subnet_a_cidr_block = "10.0.32.0/20"
  private_subnet_b_cidr_block = "10.0.48.0/20"
}
