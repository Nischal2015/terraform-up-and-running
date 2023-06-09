terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-nischal"
    key    = "prod/services/webserver-cluster/terraform.tfstate"
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
  region = "us-west-2"
}

module "webserver_cluster" {
  source = "../../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-prod"
  db_remote_state_bucket = "terraform-state-bucket-nischal"
  db_remote_state_key    = "prod/data-stores/mysql/terraform.tfstate"

  ami_id      = "ami-0c65adc9a5c1b5d7c"
  instance_type = "t3.micro"
  min_size      = 2
  max_size      = 4
}

resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  scheduled_action_name = "scale-out-during-business-hours"
  min_size              = 2
  max_size              = 4
  desired_capacity      = 4
  recurrence            = "0 8 * * *"

  autoscaling_group_name = module.webserver_cluster.asg_name
}

resource "aws_autoscaling_schedule" "scale_in_at_night" {
  scheduled_action_name = "scale-in-at-night"
  min_size              = 2
  max_size              = 4
  desired_capacity      = 2
  recurrence            = "0 18 * * *"

  autoscaling_group_name = module.webserver_cluster.asg_name
}
