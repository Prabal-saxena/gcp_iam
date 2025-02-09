
resource "google_project_iam_member" "cloud_sql_access" {
  project = "spheric-base-448422-q9"
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:gke-service-sa@spheric-base-448422-q9.iam.gserviceaccount.com"
}

terraform {
  backend "gcs" {
    bucket  = "onlineliquorservices_bucket"
    prefix  = "terraform/iam/tfstate"
  }
}