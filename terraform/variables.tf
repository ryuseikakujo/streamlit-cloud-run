variable "app_name" {
  type    = string
  default = "streamlit"
}

variable "project" {
  type    = string
  default = "my-gcp-proj"
}

variable "repo_org_name" {
  type    = string
  default = "ryuseikakujo"
}

variable "repo_name" {
  type    = string
  default = "streamlit-cloud-run"
}

# Roles for service account which will be used to deploy Cloud Run by GHA
variable "github_actions_roles" {
  type = list(string)
  default = [
    "roles/run.admin",
    "roles/storage.admin",
    "roles/storage.objectAdmin",
    "roles/iam.serviceAccountUser",
    "roles/artifactregistry.writer",
    "roles/secretmanager.secretAccessor"
  ]
}

# Cloud Run service account role
variable "sa_roles" {
  type = list(string)
  default = [
    "roles/storage.admin",
    "roles/run.admin",
    "roles/iam.serviceAccountUser",
    "roles/bigquery.dataEditor",
    "roles/bigquery.jobUser",
  ]
}
