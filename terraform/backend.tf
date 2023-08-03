terraform {
  required_version = "= 1.5.3"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.73.1"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.73.1"
    }
  }

  backend "gcs" {
    bucket = "my-streamlit-tfstate"
    prefix = ""
  }
}
