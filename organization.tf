locals {
  admins      = { for p in var.admins : lower(p) => "admin" }
  members     = { for p in var.members : lower(p) => "member" }
  memberships = merge(local.admins, local.members)
}


resource "github_membership" "membership" {
  for_each = local.memberships

  username = each.key
  role     = each.value
}

locals {
  projects = { for p in var.projects : lookup(p, "name", lower(p.name)) => merge({
    body = null
  }, p) }
}

resource "github_organization_project" "project" {
  for_each = local.projects

  name = each.value.name
  body = each.value.body
}