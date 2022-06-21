terraform {
  backend "s3" {
    endpoint                    = "fra1.digitaloceanspaces.com"
    key                         = "terraform.tfstate"
    bucket                      = "terraform.state"
    region                      = "fra1"
    access_key                  = "Z6FTY3CMC4ZPBGLI5F5Y"
    secret_key                  = "bR8UKUKlIMPae8SOs9XyXuni1NAcxnllW0aQ8TOIqtY"
    skip_requesting_account_id  = true
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_metadata_api_check     = true
  }
}
