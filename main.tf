
resource "google_project_iam_member" "cloud_sql_access" {
  project = "noble-linker-471623-s6"
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:gke-service-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_artifactory_access" {
  project = "noble-linker-471623-s6"
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:ci-cd-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_artifactory_objectViewer" {
  project = "noble-linker-471623-s6"
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:ci-cd-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_editor" {
  project = "noble-linker-471623-s6"
  role    = "roles/editor"
  member  = "serviceAccount:ci-cd-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

terraform {
  backend "gcs" {
    bucket  = "onlineliquorservices_bucket"
    prefix  = "terraform/iam/tfstate"
  }
}