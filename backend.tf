  backend "remote" {
    organization = "dktmsprojecte"

    workspaces {
      prefix = "dktmsproject-dev"
      prefix = "dktmsproject-prod"
    }
  }
