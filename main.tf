
resource "google_project_iam_member" "cloud_sql_access" {
  project = "spheric-base-448422-q9"
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:gke-service-sa@spheric-base-448422-q9.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_artifactory_access" {
  project = "spheric-base-448422-q9"
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:ci-cd-sa@spheric-base-448422-q9.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_artifactory_objectViewer" {
  project = "spheric-base-448422-q9"
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:ci-cd-sa@spheric-base-448422-q9.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_editor" {
  project = "spheric-base-448422-q9"
  role    = "roles/editor"
  member  = "serviceAccount:ci-cd-sa@spheric-base-448422-q9.iam.gserviceaccount.com"
}

terraform {
  backend "gcs" {
    bucket  = "onlineliquorservices_bucket"
    prefix  = "terraform/iam/tfstate"
  }
}