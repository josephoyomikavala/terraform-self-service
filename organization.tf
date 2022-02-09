locals {

  # A map of admin machine users. These users are used for tasks such like CI & CD, releasing, etc.
  admin_machine_users = {
  }

  # A map of GitHub users that should have admin permissions
  admin_users = {
    "alice@kevala.com" = "alice"
    "bob@kevala.com"   = "bob"
  }

  # A map of member machine users. These users are used by automation processes such as cloning repositories
  member_machine_users = {
    "ciuser@kevala.com" = "kevala-ci"
  }

  # A map of GitHub users that should have member permissions
  member_users = {
    "stephe@kevala.com" = "cOdewars1337",
    "angela@kevala.com" = "profundidaddeplagas",
    "jenz@kevala.com"   = "jenzcancode",
  }

  # We merge the maps of members and admins and pass them as arguments to the module
  members = merge(
    local.member_machine_users,
    local.member_users
  )

  admins = merge(
    local.admin_machine_users,
    local.admin_users
  )
}

# create organization
module "organization" {
  source  = "mineiros-io/organization/github"
  version = "0.1.0"

  admins  = values(local.admins)
  members = values(local.members)
}
