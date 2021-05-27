provider "aws" {
    region = "us-east-1"
    profile = "abhi-terraformcourse"
}

module "ec2_module" {
    source = "./ec2_module"
    
}