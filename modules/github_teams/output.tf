output team_name {
  value       = github_team.team_created.name
  sensitive   = false
  description = "name of team"
}

output team_members_count {
  value       = github_team.team_created.members_count
  sensitive   = true
  description = "description"
}
