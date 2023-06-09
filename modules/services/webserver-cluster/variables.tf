variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 80
}

variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state"
  type        = string
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instances to run (e.g. t2.micro)"
  type        = string
}

variable "min_size" {
  description = "The minimum number of EC2 instances in the ASG"
}

variable "max_size" {
  description = "The maximum number of EC2 instances in the ASG"
}

variable "custom_tags" {
  description = "Custom tags to be used in ASG"
  type        = map(string)
}

variable "ami" {
  description = "The AMI to run in the cluster"
  type        = string
  default     = "ami-0261755bbcb8c4a84"
}

variable "server_text" {
  description = "The text the web server should return"
  type        = string
  default     = "Nischal Shakya"
}
