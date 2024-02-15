terraform {
  backend "s3" {
    bucket = "terraform-ansible-bucket-001"
    key    = "terraform-ansible/terraform.tfstate"
    region = "us-west-1"
  }
}
