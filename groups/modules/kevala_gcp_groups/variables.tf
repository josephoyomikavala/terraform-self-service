variable "group_name" {
  type = string
}

variable "project_id" {
  type = string
}

variable "group_email" {
  type = string
}

variable "role_to_grant" {
  type = string
}

variable "group_members" {
  type = set(string)
}
