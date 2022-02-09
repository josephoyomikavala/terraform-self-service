module "team_reviewers" {
  source  = "mineiros-io/team/github"
  version = "0.1.2"

  name        = "Reviewers"
  description = "A team of users that are mandatory for reviewing Pull Requests."
  privacy     = "secret"

  members = [
    local.member_users["stephe@kevala.com"],
    local.member_users["angela@kevala.com"]
  ]

  maintainers = values(local.admin_users)
}

module "team_contributors" {
  source  = "mineiros-io/team/github"
  version = "0.1.2"

  name        = "Contributors"
  description = "A team of users that have the permission to contribute to repositories that are assigned to the team."
  privacy     = "secret"

  members = [
    local.member_users["stephe@kevala.com"],
    local.member_users["angela@kevala.com"],
    local.member_users["jenz@kevala.com"]
  ]

  maintainers = values(local.admin_users)
}
