# Wrokload Identity for GHA.
resource "google_iam_workload_identity_pool" "github_actions" {
  provider                  = google-beta
  workload_identity_pool_id = "github-actions-pool" # If pool has same id exists in the project, you need to change id to another name.
  project                   = var.project
}

resource "google_iam_workload_identity_pool_provider" "github_actions" {
  provider                           = google-beta
  workload_identity_pool_id          = google_iam_workload_identity_pool.github_actions.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-actions-provider"
  display_name                       = "github-actions-provider"
  description                        = "For GitHub Actions CICD"
  project                            = var.project
  attribute_condition                = <<-EOT
  attribute.repository == "${var.repo_org_name}/${var.repo_name}"
  EOT
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
    "attribute.aud"        = "assertion.aud"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

# Add workload identity user role to the service account.
resource "google_service_account_iam_member" "workload_identity_account_iam" {
  service_account_id = google_service_account.github_actions.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_actions.name}/attribute.repository/${var.repo_org_name}/${var.repo_name}"
}

resource "google_service_account" "github_actions" {
  project      = var.project
  account_id   = "github-actions-deployer"
  display_name = "github-actions-deployer"
}

# Add roles to the service account.
resource "google_project_iam_member" "github_actions" {
  for_each = toset(var.github_actions_roles)

  project = var.project
  role    = each.value
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}
