provider "aws" {
  region = "eu-west-1"
  assume_role {
    role_arn = "arn:aws:iam::135544376709:role/NonprodProvisionerRole"
  }
  default_tags {
    tags = {
      project     = var.project
      nonuke      = var.nonuke
      environment = "nonprod"
    }
  }
}