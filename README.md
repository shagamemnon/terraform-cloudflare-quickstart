# Terraform | Cloudflare - Quickstart

## Setup

1. Copy the `terraform.tfvars.example` file to `terraform.tfvars` and fill is as appropriate:
```sh
cp terraform.tfvars.example terraform.tfvars
```

2. After you have your `terraform.tfvars` file in place run the following.

```sh
terraform init
terraform plan --out=first.plan
terraform apply "first.plan"
```

3. Assuming you had no issues Terraform will start to build the environment by making API calls to Cloudflare on your behalf.

> This repo was written with Terraform v0.12.29 but can easily be converted to be compatabile with Terraform 0.13 or 0.14 versions. The change is in the main.tf file by updating the Cloudflare provider. If you need a tool to switch between versions of Terraform you should look at [tfswitch](https://github.com/warrensbox/terraform-switcher/) and then you can use multiple versions of terraform easily.

## Notes

This repository does the following:

- `dns.tf` Creates DNS records for several end points
- `firewallrules.tf` Creates Firewall Rules filters, and implements various Firewall Rules actions
- `ratelimit.tf` Creates sample rate limiting rules
- `waf.tf` Changes OWASP rule set to `Medium` sensitivity with a `Simulate` action
- `waf.tf` Turns `on` the OWASP Bad Robots rule group
- `waf.tf` Turns `on` the OWASP URI XSS rule group
- `waf.tf` Sets OWASP rule 100000356 and URI-958000 to `off`
- `waf.tf` Turns Cloudflare Drupal WAF Ruleset to`off`
- `waf.tf` Turns Cloudflare Flash WAF Ruleset to `off`
- `waf.tf` Turns Cloudflare Miscellaneous WAF Ruleset to `on`
- `waf.tf` Sets Cloudflare Specials WAF rule 100000 to `simulate`
- `waf.tf` Sets Cloudflare Specials WAF rule 100015 to `challenge`
- `waf.tf` Creates a non-HTTP (Cloudflare Spectrum) application at ssh.example.com over a VM instance SSH port
