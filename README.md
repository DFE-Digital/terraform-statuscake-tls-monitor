# StatusCake TLS Monitor

[![Terraform CI](https://github.com/DFE-Digital/terraform-statuscake-tls-monitor/actions/workflows/continuous-integration-terraform.yml/badge.svg?branch=main)](https://github.com/DFE-Digital/terraform-statuscake-tls-monitor/actions/workflows/continuous-integration-terraform.yml?branch=main)
[![GitHub release](https://github.com/DFE-Digital/terraform-statuscake-tls-monitor/releases)](https://github.com/DFE-Digital/terraform-statuscake-tls-monitor/releases)

Monitor your web apps TLS expiry and connect alerts to StatusCake contact groups or integrations.

To use this module you must have a StatusCake API token.

1) Log in to StatusCake and visit your [User Profile](https://app.statuscake.com/User.php)
2) Scroll down to 'MANAGE API KEYS' and click 'Generate new key'
3) A new key will be generated for you. Scroll back down to 'MANAGE API KEYS' and grab your new Key
4) Load the module using the example below


## Usage

Example module usage:

```hcl
variable "statuscake_api_token" {
  description = "API token for StatusCake"
  type        = string
  sensitive   = true
}

module "statuscake-tls-monitor" {
  source  = "github.com/dfe-digital/terraform-statuscake-tls-monitor?ref=v0.1.0"

  statuscake_api_token                     = var.statuscake_api_token # probably best not to hard code this!
  statuscake_check_interval                = 43200 # check every 12 hours
  statuscake_monitored_resource_address    = "https://www.my-website-to-check.education.gov.uk"
  statuscake_alert_at                      = [ # days to alert on
    60, 30, 14, 7, 3, 1
  ]
  statuscake_notify_on_reminder            = true
  statuscake_notify_on_expiry              = true
  statuscake_notify_on_broken              = false
  statuscake_notify_on_mixed               = false
  statuscake_contact_group_name            = "My Contact Group"
  statuscake_contact_group_email_addresses = [
    "my-first-responder@email.com",
    "my-second-responder@email.com",
  ]
  statuscake_contact_group_integrations    = [
    "0000-1111-2222-3333456" # source this from StatusCake
  ]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.1 |
| <a name="requirement_statuscake"></a> [statuscake](#requirement\_statuscake) | >= 2.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_statuscake"></a> [statuscake](#provider\_statuscake) | 2.2.1 |

## Resources

| Name | Type |
|------|------|
| [statuscake_contact_group.monitoring_team](https://registry.terraform.io/providers/StatusCakeDev/statuscake/latest/docs/resources/contact_group) | resource |
| [statuscake_ssl_check.main](https://registry.terraform.io/providers/StatusCakeDev/statuscake/latest/docs/resources/ssl_check) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_statuscake_alert_at"></a> [statuscake\_alert\_at](#input\_statuscake\_alert\_at) | StatusCake alerts at the specified number of days before expiration | `list(number)` | `[]` | no |
| <a name="input_statuscake_api_token"></a> [statuscake\_api\_token](#input\_statuscake\_api\_token) | API token for StatusCake | `string` | n/a | yes |
| <a name="input_statuscake_check_interval"></a> [statuscake\_check\_interval](#input\_statuscake\_check\_interval) | Number of minutes between each TLS check | `number` | `43200` | no |
| <a name="input_statuscake_contact_group_email_addresses"></a> [statuscake\_contact\_group\_email\_addresses](#input\_statuscake\_contact\_group\_email\_addresses) | List of email address that should receive notifications from StatusCake | `list(string)` | `[]` | no |
| <a name="input_statuscake_contact_group_integrations"></a> [statuscake\_contact\_group\_integrations](#input\_statuscake\_contact\_group\_integrations) | List of Integration IDs to connect to your Contact Group | `list(string)` | `[]` | no |
| <a name="input_statuscake_contact_group_name"></a> [statuscake\_contact\_group\_name](#input\_statuscake\_contact\_group\_name) | Name of the contact group in StatusCake | `string` | `""` | no |
| <a name="input_statuscake_monitored_resource_address"></a> [statuscake\_monitored\_resource\_address](#input\_statuscake\_monitored\_resource\_address) | The URL to perform TLS checks on | `string` | n/a | yes |
| <a name="input_statuscake_notify_on_broken"></a> [statuscake\_notify\_on\_broken](#input\_statuscake\_notify\_on\_broken) | Send StatusCake problem alerts when your certificate has issues which cause it to throw errors. | `bool` | `false` | no |
| <a name="input_statuscake_notify_on_expiry"></a> [statuscake\_notify\_on\_expiry](#input\_statuscake\_notify\_on\_expiry) | Send StatusCake expiration alerts when your certificate has expired. | `bool` | `true` | no |
| <a name="input_statuscake_notify_on_mixed"></a> [statuscake\_notify\_on\_mixed](#input\_statuscake\_notify\_on\_mixed) | Send StatusCake warnings whenever insecure content gets loaded on your HTTPS enabled website. | `bool` | `false` | no |
| <a name="input_statuscake_notify_on_reminder"></a> [statuscake\_notify\_on\_reminder](#input\_statuscake\_notify\_on\_reminder) | Send StatusCake reminders when your certificate is about to expire. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_statuscake_contact_group"></a> [statuscake\_contact\_group](#output\_statuscake\_contact\_group) | n/a |
| <a name="output_statuscake_ssl_check"></a> [statuscake\_ssl\_check](#output\_statuscake\_ssl\_check) | n/a |
<!-- END_TF_DOCS -->
