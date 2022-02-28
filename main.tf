module "organization" {
  source            = "./modules/organization"
  projects          = var.projects
  members           = var.members
  admins            = var.admins
  organization_name = var.organization_name
}

module "infrastructure-team" {
  source            = "./modules/github_teams"
  team_name         = "Infrastructure Team"
  team_members      = var.infrastructure_team_members
  team_description  = "Skunk Works"
  repositories      = var.infrastructure_repos
  organization_name = var.organization_name
}

module "data-team" {
  source            = "./modules/github_teams"
  team_name         = "Data Team"
  team_members      = var.data_team_members
  team_description  = "Data Analytics"
  repositories      = var.data_repos
  organization_name = var.organization_name
}

module "service_accounts" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~> 4.0"
  project_id    = var.project_id
  prefix        = "sa"
  names         = ["provisioner"]
  project_roles = [
    "project-1=>roles/viewer",
    "project-2=>roles/storage.objectViewer",
  ]
}

