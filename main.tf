
resource "google_service_account_iam_policy" "gke-iam-policy" {
  service_account_id = "gke-service-sa@spheric-base-448422-q9.iam.gserviceaccount.com"
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