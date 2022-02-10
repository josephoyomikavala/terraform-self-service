# terraform organization variables

variable "projects" {
  description = "A list of projects to add to the organization."
  type        = list(any)
}

variable "members" {
  description = "A list of members to add to the organization."
  type        = set(string)
  # default = [
  #   "terraform-test-user-1",
  #   "terraform-test-user-2",
  # ]
}

variable "admins" {
  description = "A list of admins to add to the organization."
  type        = set(string)
  # default = [
  #   "terraform-test-admin",
  # ]
}

# teams addition
variable "teams" {
  type        = map(any)
  description = "list of teams"
}

