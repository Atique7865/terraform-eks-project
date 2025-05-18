terraform {
  backend "s3" {
    bucket         = "my-terraform-eks-state"
    key            = "eks-cluster/terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

module "vpc" {
  source                = "./modules/vpc"
  cidr_block            = "10.0.0.0/16"
  name                  = "eks-vpc"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  azs                  = ["ap-northeast-1a", "ap-northeast-1c"]
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.27"
  subnet_ids      = module.vpc.private_subnet_ids
  vpc_id          = module.vpc.vpc_id
}
