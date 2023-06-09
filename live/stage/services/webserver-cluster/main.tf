terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-nischal"
    key    = "stage/services/webserver-cluster/terraform.tfstate"
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

module "webserver_cluster" {
  source = "../../../../modules/services/webserver-cluster"

  cluster_name           = "webserver-stage"
  db_remote_state_bucket = "terraform-state-bucket-nischal"
  db_remote_state_key    = "stage/data-stores/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 2
}