

resource "github_team" "infrastructure-team" {
  name        = "Infrastructure Team"
  description = "skunk works"
}

resource "github_team" "data-team" {
  name        = "Data Team"
  description = "team responsible for data analytics"
}


resource "github_team_membership" "infrastructure_team_memberships" {
  for_each = {for team_member in var.infrastructure_team_members : lower(team_member.name) => lower(team_member.role)}

  team_id  = github_team.infrastructure-team.id
  username = each.key
  role     = each.value
}

resource "github_team_membership" "data_team_memberships" {
  for_each = {for team_member in var.data_team_members : lower(team_member.name) => lower(team_member.role)}

  team_id  = github_team.data-team.id
  username = each.key
  role     = each.value
}

# locals {
#   repo_admin = { for i in var.admin_repositories : lower(i) => "admin" }
#   repo_push  = { for i in var.push_repositories : lower(i) => "push" }
#   repo_pull  = { for i in var.pull_repositories : lower(i) => "pull" }

#   repositories = merge(local.repo_admin, local.repo_push, local.repo_pull)
# }

# resource "github_team_repository" "team_repository" {
#   for_each = local.repositories

#   repository = each.key
#   team_id    = github_team.team.id
#   permission = each.value
# }
