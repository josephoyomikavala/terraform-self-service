variable team_name {
  type        = string
  default     = ""
  description = "description"
}

variable team_members {
  type        = set(any)
  # default     = [{ name = "katschlorff", role = "member" }]
  description = "members of the team"
}

variable team_description {
  type        = string
  default     = ""
  description = "further description of what the team is about"
}

variable repositories {
  type        = set(any)
  # default     = [
    # { name = "passport", description = "Authentication repo", visibility = "private"}
    # { name: "conductor", description: "grid-assessor tool",visibility = "public"}
  #]
  description = "description"
}

variable organization_name {
  type        = string
  default     = ""
  description = "description"
}

