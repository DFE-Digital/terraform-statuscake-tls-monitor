locals {
  statuscake_check_interval                = var.statuscake_check_interval
  statuscake_monitored_resource_addresses  = toset(var.statuscake_monitored_resource_addresses)
  statuscake_alert_at                      = var.statuscake_alert_at
  statuscake_notify_on_reminder            = var.statuscake_notify_on_reminder
  statuscake_notify_on_expiry              = var.statuscake_notify_on_expiry
  statuscake_notify_on_broken              = var.statuscake_notify_on_broken
  statuscake_notify_on_mixed               = var.statuscake_notify_on_mixed
  statuscake_contact_group_name            = var.statuscake_contact_group_name
  statuscake_contact_group_email_addresses = var.statuscake_contact_group_email_addresses
  statuscake_contact_group_integrations    = var.statuscake_contact_group_integrations
}
