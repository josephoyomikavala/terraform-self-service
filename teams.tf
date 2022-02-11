resource "github_team" "kevala-teams" {
  for_each    = var.teams
  name        = each.value.name
  description = each.value.description
}


locals {
  team_and_members = { for item in flatten([for team in github_team.kevala-teams : [for member in [for x in var.teams : x.members if x.name == team.name][0] : { username = member, role = "member", team_id = team.id }]]) : (format("%s-%s", item.team_id, item.username)) => item }
}

resource "github_team_membership" "members-of-team" {

  for_each = local.team_and_members
  team_id  = each.value.team_id
  username = each.value.username
  role     = each.value.role

  depends_on = [github_team.kevala-teams, local.team_and_members]

}
