resource "google_project_iam_member" "cicd_artifactory_access" {
  project = var.project
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:ci-cd-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_artifactory_objectViewer" {
  project = var.project
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:ci-cd-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_editor" {
  project = var.project
  role    = "roles/editor"
  member  = "serviceAccount:ci-cd-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_artifactory_writer" {
  project = var.project
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:ci-cd-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_cloud_storage_admin" {
  project = var.project
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:ci-cd-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_gke_developer" {
  project = var.project
  role    = "roles/container.developer"
  member  = "serviceAccount:ci-cd-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_workload_identity_user" {
  project = var.project
  role    = "roles/iam.workloadIdentityUser"
  member  = "serviceAccount:ci-cd-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_container_admin" {
  project = var.project
  role    = "roles/container.admin"
  member  = "serviceAccount:ci-cd-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_token_creator" {
  project = var.project
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "serviceAccount:ci-cd-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_cloudsql_admin" {
  project = var.project
  role    = "roles/cloudsql.admin"
  member  = "serviceAccount:ci-cd-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cicd_networkUser" {
  project = var.project
  role    = "roles/compute.networkUser"
  member  = "serviceAccount:ci-cd-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "sql_proxy_cloudsql_client" {
  project = var.project
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:sql-proxy-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

# Secret Manager Access for all services
resource "google_project_iam_member" "secretmanager-access-product" {
  project = var.project
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:product-service-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "secretmanager-access-order" {
  project = var.project
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:order-service-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "secretmanager-access-user" {
  project = var.project
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:user-service-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

# Cloud SQL Access for Order Service
resource "google_project_iam_member" "order-sql-client" {
  project = var.project
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:order-service-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

# Cloud SQL Access for User Service
resource "google_project_iam_member" "user-sql-client" {
  project = var.project
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:user-service-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

# HELM SA IAM roles
resource "google_project_iam_member" "ecom-helm-cluster-viewer" {
  project = var.project
  role    = "roles/container.clusterViewer"
  member  = "serviceAccount:ecom-helm-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "ecom-helm-k8s-developer" {
  project = var.project
  role    = "roles/container.developer"
  member  = "serviceAccount:ecom-helm-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "ecom-helm-artifact-registry" {
  project = var.project
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:ecom-helm-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "ecom-helm-sa-user" {
  project = var.project
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:ecom-helm-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
}

#====================================================
# KSA binds to GSA for WIF through IAM policy binding
#====================================================
resource "google_service_account_iam_member" "ksa_gsa_workload_identity_user" {
  service_account_id = "projects/project-3fd94e98-1d48-43cd-8c1/serviceAccounts/ci-cd-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
  role = "roles/iam.workloadIdentityUser"
  member = "serviceAccount:project-3fd94e98-1d48-43cd-8c1.svc.id.goog[app-microservices/product-service-ci-cd-sa]"
}

resource "google_service_account_iam_member" "ksa_gsa_workload_identity_user_order_service" {
  service_account_id = "projects/project-3fd94e98-1d48-43cd-8c1/serviceAccounts/ci-cd-sa@project-3fd94e98-1d48-43cd-8c1.iam.gserviceaccount.com"
  role = "roles/iam.workloadIdentityUser"
  member = "serviceAccount:project-3fd94e98-1d48-43cd-8c1.svc.id.goog[app-microservices/order-service-ci-cd-sa]"
}

terraform {
  backend "gcs" {
    bucket  = "onlineliquorservicesbucket"
    prefix  = "terraform/iam/tfstate"
  }
}