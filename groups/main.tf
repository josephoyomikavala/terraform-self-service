resource "google_project" "project_x" {
  name       = "Kevala test group self service"
  project_id = "kv-test-self-service-groups"
}

resource "google_project_iam_binding" "project_x_iam_policy" {
  project     = google_project.project_x.id
  role = "roles/bigquery.admin"

  members = [
    "group:${google_cloud_identity_group.team_x_dba_group.group_key.id}"
  ]
}



