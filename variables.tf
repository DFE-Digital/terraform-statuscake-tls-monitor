variable "statuscake_monitored_resource_addresses" {
  description = "The URLs to perform TLS checks on"
  type        = list(string)
  default     = []
}

variable "statuscake_alert_at" {
  description = "StatusCake alerts at the specified number of days before expiration"
  type        = list(number)
  default     = []
}

variable "statuscake_notify_on_reminder" {
  description = "Send StatusCake reminders when your certificate is about to expire."
  type        = bool
  default     = true
}

variable "statuscake_notify_on_expiry" {
  description = "Send StatusCake expiration alerts when your certificate has expired."
  type        = bool
  default     = true
}

variable "statuscake_notify_on_broken" {
  description = "Send StatusCake problem alerts when your certificate has issues which cause it to throw errors."
  type        = bool
  default     = false
}

variable "statuscake_notify_on_mixed" {
  description = "Send StatusCake warnings whenever insecure content gets loaded on your HTTPS enabled website."
  type        = bool
  default     = false
}

variable "statuscake_contact_group_name" {
  description = "Name of the contact group in StatusCake"
  type        = string
  default     = ""
}

variable "statuscake_contact_group_email_addresses" {
  description = "List of email address that should receive notifications from StatusCake"
  type        = list(string)
  default     = []
}

variable "statuscake_check_interval" {
  description = "Number of minutes between each TLS check"
  type        = number
  default     = 86400 # 24 hours
}

variable "statuscake_contact_group_integrations" {
  description = "List of Integration IDs to connect to your Contact Group"
  type        = list(string)
  default     = []
}
