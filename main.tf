module "organization" {
  source   = "./modules/organization"
  projects = var.projects
  members  = var.members
  admins   = var.admins
}

module "infrastructure-team" {
  source           = "./modules/github_teams"
  team_name        = "Infrastructure Team"
  team_members     = var.infrastructure_team_members
  team_description = "Skunk Works"
}

module "data-team" {
  source           = "./modules/github_teams"
  team_name        = "Data Team"
  team_members     = var.data_team_members
  team_description = "Data Analytics"
}