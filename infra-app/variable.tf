variable "env" {
  description = "This is the environment for infra app(dev/prod)"
  type = string
}

variable "bucket_name" {
  description = "This is the name of my bucket"
  type = string
}

variable "instance_count" {
  description = "This is the number of ec2 instance"
  type = number
}

variable "instance_type" {
  description = "This is the instance typr of my ec2"
  type = string
}