

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
