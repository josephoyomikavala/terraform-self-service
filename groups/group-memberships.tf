resource "google_cloud_identity_group_membership" "project_x_dba_group_membership" {
  for_each = toset(var.team_x_dba_members)

  group    = google_cloud_identity_group.team_x_dba_group.id

  preferred_member_key { id = "${each.key}@kevala.com" }

  roles { name = "MEMBER" }
}