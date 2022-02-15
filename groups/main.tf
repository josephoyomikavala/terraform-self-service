resource "google_project" "project_x" {
  name       = "Kevala test group self service"
  project_id = "kv-test-self-service-groups"
}

module "kats_cool_group" {
  source = "./modules/kevala_gcp_groups"
  group_email = "infra-team-testing@kevala.com"
  group_members = ["kat.schlorff", "eric.arellano", "hannah", "james.ethridge", "joseph.oyomi"]
  group_name = "kats-cool-group"
  project_id = google_project.project_x.project_id
  role_to_grant = "roles/gkehub.admin"
}

