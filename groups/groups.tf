data "google_organization" "org" {
  domain = "kevala.com"
}

resource "google_cloud_identity_group" "team_x_dba_group" {
  display_name = "team-x-DBAs"

  group_key {
    id = "team-x@kevala.com"
  }

  parent = "customers/${data.google_organization.org.directory_customer_id}"

  labels = {
    "cloudidentity.googleapis.com/groups.discussion_forum" = ""
  }
}

