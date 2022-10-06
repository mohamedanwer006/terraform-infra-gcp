resource "google_service_account" "kubernetes_sa" {
  account_id   = "kubernetes"
  display_name = "Kubernetes-sa"
}


resource "google_project_iam_member" "storage-object-viewer" {
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.kubernetes_sa.email}"
  depends_on = [
    google_service_account.kubernetes_sa
  ]
  project = var.project_id
}

