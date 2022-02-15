resource "googleworkspace_group" "workspace_email_group" {
  email = var.group_email
  name  = var.group_name
}

resource "googleworkspace_group_settings" "workspace_email_group_settings" {
  email = googleworkspace_group.workspace_email_group.email

  allow_external_members = false

  who_can_contact_owner   = "ALL_IN_DOMAIN_CAN_CONTACT"
  who_can_join            = "INVITED_CAN_JOIN"
  who_can_view_membership = "ALL_MANAGERS_CAN_VIEW"
  who_can_post_message    = "ALL_OWNERS_CAN_POST"
}

resource "googleworkspace_group_member" "workspace_email_group_member" {
  for_each = var.group_members
  group_id = googleworkspace_group.workspace_email_group.id
  email    = "${each.key}@kevala.com"

  role = "MEMBER"
}

data "google_organization" "org" {
  domain = "kevala.com"
}

resource "google_project_iam_binding" "project_iam_binding" {
  project = var.project_id
  role    = var.role_to_grant

  members = [
    "group:${google_cloud_identity_group.iam_group.group_key.id}"
  ]
}

resource "google_cloud_identity_group" "iam_group" {
  display_name = var.group_name

  group_key {
    id = googleworkspace_group.workspace_email_group.email
  }

  parent = "customers/${data.google_organization.org.directory_customer_id}"

  labels = {
    "cloudidentity.googleapis.com/groups.discussion_forum" = ""
  }
}

resource "google_cloud_identity_group_membership" "project_x_dba_group_membership" {
  for_each = var.group_members

  group = google_cloud_identity_group.iam_group.id

  preferred_member_key { id = "${each.key}@kevala.com" }

  roles { name = "MEMBER" }
}


