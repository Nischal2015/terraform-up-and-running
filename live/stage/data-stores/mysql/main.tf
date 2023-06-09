terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-nischal"
    key    = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-west-2"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.1.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

module "mysql" {
  source = "../../../../modules/data-stores/mysql"

  ami_id      = "ami-0261755bbcb8c4a84"
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  env         = "stage"
}