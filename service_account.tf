#------------------------------------------------------------------------------#
#                             Service  Account                                 #
#------------------------------------------------------------------------------#

#----------------------------#
# gke Service Account        #
#----------------------------#
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

#----------------------------#
# gs Service Account         #
#----------------------------#
resource "google_service_account" "gs_sa" {
  account_id   = "googlstoragesa"
  display_name = "gs-sa"
}


resource "google_project_iam_member" "storage_viewer" {
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.gs_sa.email}"
  depends_on = [
    google_service_account.gs_sa
  ]
  project = var.project_id
}


#----------------------------#
# bigQuery Service Account   #
#----------------------------#
resource "google_service_account" "bq_sa" {
  account_id   = "bigquerysa"
  display_name = "bq-sa"
}

resource "google_project_iam_member" "bq_viewer" {
  role          = "roles/bigquery.dataViewer"
  member = "serviceAccount:${google_service_account.bq_sa.email}"
  depends_on = [
    google_service_account.bq_sa
  ]
  project = var.project_id
}