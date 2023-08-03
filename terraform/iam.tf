# Cloud Run service account
resource "google_service_account" "streamlit" {
  project      = var.project
  account_id   = var.app_name
  display_name = var.app_name
}

resource "google_project_iam_member" "streamlit" {
  for_each = toset(var.sa_roles)

  project = var.project
  role    = each.value
  member  = "serviceAccount:${google_service_account.streamlit.email}"
}
