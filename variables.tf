variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
}

variable "name" {
  type = string
}

variable "rg_name" {
  type        = string
  description = "(optional) describe your variable"
}


variable "location" {
  type = string
}

variable "storage" {
  type = object({
    name         = string
    type         = string
    account_name = string
    share_name   = string
    access_key   = string
    mount_path   = string
  })
}

variable "app_service_plan_id" {
  type = string
}

variable "health_check_path" {
  type    = string
  default = "/health"
}