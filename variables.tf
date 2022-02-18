# terraform organization variables

variable "projects" {
  description = "A list of projects to add to the organization."
  type        = list(any)
}

variable "members" {
  description = "A list of members to add to the organization."
  type        = set(string)
}

variable "admins" {
  description = "A list of admins to add to the organization."
  type        = set(string)

}

variable "organization_name" {
  type        = string
  default     = ""
  description = "description"
}


# teams 
# teams addition 
# optional ----------------
variable "description" {
  description = "A description of the team."
  type        = string
  default     = ""
}

variable "privacy" {
  description = "The level of privacy for the team. Must be one of secret or closed."
  type        = string
  default     = "secret"
}

variable "admin_repositories" {
  description = "A list of repository names the current team should get admin (full) permission to."
  type        = set(string)
  default     = []
}

variable "push_repositories" {
  description = "A list of repository names the current team should get push (read-write) permission to."
  type        = set(string)
  default     = []
}

variable "pull_repositories" {
  description = "A list of repository names the current team should get pull (read-only) permission to."
  type        = set(string)
  default     = []
}

variable "infrastructure_team_members" {
  type        = set(any)
  description = "description"
}

variable "data_team_members" {
  type        = set(any)
  description = "description"
}


variable "infrastructure_repos" {
  type = set(any)
  # default     = [
  # { name = "passport", description = "Authentication repo", visibility = "private"}
  # { name: "conductor", description: "grid-assessor tool",visibility = "public"}
  #]
  description = "description"
}

variable "data_repos" {
  type = set(any)
  # default     = [
  # { name = "passport", description = "Authentication repo", visibility = "private"}
  # { name: "conductor", description: "grid-assessor tool",visibility = "public"}
  #]
  description = "description"
}

variable project_id {
  type        = string
  default     = ""
  description = "description"
}
