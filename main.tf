provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    # Lembre de trocar o bucket para o seu, não pode ser o mesmo nome
    bucket = "terraform-fernandostn"
    #dynamodb_table = "terraform-state-lock-dynamo"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}