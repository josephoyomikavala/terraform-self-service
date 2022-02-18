projects = [
  {
    name = "Grid Assessor"
    body = "the main project for grid-assessor"
  },
  {
    name = "Project 2"
    body = ""
  }
]

admins  = ["josephoyomikavala"]
members = ["katschlorff"]

infrastructure_team_members = [{ name = "katschlorff", role = "member" }]
data_team_members           = [{ name = "josephoyomikavala", role = "maintainer" }]

organization_name = "KevalaAnalytics"

infrastructure_repos = [
  { name = "passport", description = "Authentication repo", visibility = "private" },
  { name = "conductor", description = "grid-assessor helper tool", visibility = "public" }
]