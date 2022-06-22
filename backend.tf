terraform {
  backend "s3" {
    skip_requesting_account_id  = true
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_metadata_api_check     = true
    access_key = "S5BPDW3N5WFHUXVAMBTM"
    secret_key = "XDwbO8Vl6t1jjvckuxWx1uNn0gTCZgN4V523J/95E1c"
    endpoint                    = "fra1.digitaloceanspaces.com"
    key                         = "terraform.tfstate"
    bucket                      = "terraform.state"
    region                      = "fra1"

  }
}