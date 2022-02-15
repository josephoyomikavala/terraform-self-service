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
