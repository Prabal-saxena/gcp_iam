
resource "google_service_account_iam_policy" "gke-iam-policy" {
  service_account_id = "gke-service-sa"
  policy_data        = data.google_iam_policy.gke-iam.policy_data
}

data "google_iam_policy" "gke-iam" {
  binding {
    role = "roles/cloudsql.client"

    members = [
      "user:cammondo98@gmail.com",
    ]
  }
}

terraform {
  backend "gcs" {
    bucket  = "onlineliquorservices_bucket"
    prefix  = "terraform/iam/tfstate"
  }
}