resource "github_team" "team_created" {
  name        = var.team_name
  description = var.team_description
}


resource "github_team_membership" "team_members" {
  for_each = {for team_member in var.team_members : lower(team_member.name) => lower(team_member.role)}

  team_id  = github_team.team_created.id
  username = each.key
  role     = each.value
}

resource "github_repository" "repositories" {
  for_each = { for repo in var.repositories : lower(repo.name) => repo } 
  name        = each.key
  description = each.value.description

  visibility = each.value.visibility
}

resource "github_team_repository" "team_repository" {
  for_each = { for repo in github_repository.repositories: lower(repo.name) => repo}

  team_id    = github_team.team_created.id
  repository = each.key
  permission = var.team_permission
}