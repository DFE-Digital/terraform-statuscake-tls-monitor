provider "statuscake" {
  api_token = local.statuscake_api_token
}

resource "statuscake_ssl_check" "main" {
  check_interval = local.statuscake_check_interval # Interval in seconds to test. (12 hours)
  contact_groups = [statuscake_contact_group.monitoring_team[0].id]

  alert_config {
    alert_at = local.statuscake_alert_at

    on_reminder = local.statuscake_on_reminder
    on_expiry   = local.statuscake_on_expiry
    on_broken   = local.statuscake_on_broken
    on_mixed    = local.statuscake_on_mixed
  }

  monitored_resource {
    address = local.statuscake_monitored_resource_address
  }
}

resource "statuscake_contact_group" "monitoring_team" {
  count = local.statuscake_contact_group_name != "" ? 1 : 0

  name            = local.statuscake_contact_group_name
  email_addresses = local.statuscake_contact_group_email_addresses
  integrations    = local.statuscake_contact_group_integrations
}