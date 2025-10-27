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

resource "google_project_iam_member" "cicd_artifactory_writer" {
  project = "noble-linker-471623-s6"
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:ci-cd-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_cloud_storage_admin" {
  project = "noble-linker-471623-s6"
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:ci-cd-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_gke_developer" {
  project = "noble-linker-471623-s6"
  role    = "roles/container.developer"
  member  = "serviceAccount:ci-cd-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_workload_identity_user" {
  project = "noble-linker-471623-s6"
  role    = "roles/iam.workloadIdentityUser"
  member  = "serviceAccount:ci-cd-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_container_admin" {
  project = "noble-linker-471623-s6"
  role    = "roles/container.admin"
  member  = "serviceAccount:ci-cd-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_token_creator" {
  project = "noble-linker-471623-s6"
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "serviceAccount:ci-cd-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_cloudsql_admin" {
  project = "noble-linker-471623-s6"
  role    = "roles/cloudsql.admin"
  member  = "serviceAccount:ci-cd-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_networkUser" {
  project = "noble-linker-471623-s6"
  role    = "roles/compute.networkUser"
  member  = "serviceAccount:ci-cd-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "sql_proxy_cloudsql_client" {
  project = "noble-linker-471623-s6"
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:sql-proxy-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

# Secret Manager Access for all services
resource "google_project_iam_member" "secretmanager-access-product" {
  project = "noble-linker-471623-s6"
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:product-service-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "secretmanager-access-order" {
  project = "noble-linker-471623-s6"
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:order-service-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "secretmanager-access-user" {
  project = "noble-linker-471623-s6"
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:user-service-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

# Cloud SQL Access for Order Service
resource "google_project_iam_member" "order-sql-client" {
  project = "noble-linker-471623-s6"
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:order-service-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

# Cloud SQL Access for User Service
resource "google_project_iam_member" "user-sql-client" {
  project = "noble-linker-471623-s6"
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:user-service-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

# HELM SA IAM roles
resource "google_project_iam_member" "ecom-helm-cluster-viewer" {
  project = "noble-linker-471623-s6"
  role    = "roles/container.clusterViewer"
  member  = "serviceAccount:ecom-helm-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "ecom-helm-k8s-developer" {
  project = "noble-linker-471623-s6"
  role    = "roles/container.developer"
  member  = "serviceAccount:ecom-helm-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "ecom-helm-artifact-registry" {
  project = "noble-linker-471623-s6"
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:ecom-helm-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "ecom-helm-sa-user" {
  project = "noble-linker-471623-s6"
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:ecom-helm-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
}

#====================================================
# KSA binds to GSA for WIF through IAM policy binding
#====================================================
resource "google_service_account_iam_member" "ksa_gsa_workload_identity_user" {
  service_account_id = "projects/noble-linker-471623-s6/serviceAccounts/ci-cd-sa@noble-linker-471623-s6.iam.gserviceaccount.com"
  role = "roles/iam.workloadIdentityUser"
  member = "serviceAccount:noble-linker-471623-s6.svc.id.goog[app-microservices/product-service-ci-cd-sa]"
}

terraform {
  backend "gcs" {
    bucket  = "onlineliquorservices_bucket"
    prefix  = "terraform/iam/tfstate"
  }
}