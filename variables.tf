variable "topics" {
  type = list(string)
  default = [
    "iac",
    "terraform",
    "terraform-modules",
  ]
  description = "repository topics"
}

variable "admin_users" {
  type = map(string)
  default = {
    "alice@kevala.com" = "alice"
    "bob@kevala.com"   = "bob"
  }
  description = "description"
}
