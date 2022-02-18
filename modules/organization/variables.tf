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

variable organization_name {
  type        = string
  default     = ""
  description = "description"
}

