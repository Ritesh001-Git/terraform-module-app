// dev infracture
module "dev-infra" {
  source         = "./infra-app"
  env            = "dev"
  bucket_name    = "ritesh-swain-bucket"
  instance_count = 1
  instance_type  = "t3.micro"
  ami_id         = "ami-0ec10929233384c7f" // Ubuntu Server 24.04 LTS
  hash_key       = "InfraId"
}

module "prd-infra" {
  source         = "./infra-app"
  env            = "prd"
  bucket_name    = "ritesh-swain-bucket"
  instance_count = 1
  instance_type  = "t3.micro"
  ami_id         = "ami-0ec10929233384c7f" // Ubuntu Server 24.04 LTS
  hash_key       = "InfraId"
}

module "stg-infra" {
  source         = "./infra-app"
  env            = "stg"
  bucket_name    = "ritesh-swain-bucket"
  instance_count = 1
  instance_type  = "t3.micro"
  ami_id         = "ami-0ec10929233384c7f" // Ubuntu Server 24.04 LTS
  hash_key       = "InfraId"
}
