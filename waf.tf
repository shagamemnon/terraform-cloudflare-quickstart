## Adjusting the OWASP settings
### Generate data object for package_id variable
data "cloudflare_waf_packages" "owaspPackage" {
    zone_id = var.cloudflare_zone_id
    filter {
        name = "OWASP ModSecurity Core Rule Set"
    }
}

resource "cloudflare_waf_package" "owasp" {
    package_id = data.cloudflare_waf_packages.owaspPackage.packages.0.id
    zone_id = var.cloudflare_zone_id
    sensitivity = "medium"
    action_mode = "simulate"
}

## Adjusting OWASP rule groups (sets)
### Generating data object for group_id variable
data "cloudflare_waf_groups" "owaspBadRobot" {
    zone_id = var.cloudflare_zone_id
    filter {
        name = "OWASP Bad Robots"
    }
}
### Turns OWASP rule group OWASP Bad Robot to On
resource "cloudflare_waf_group" "owaspBadRobot" {
    group_id = data.cloudflare_waf_groups.owaspBadRobot.groups.0.id
    zone_id = var.cloudflare_zone_id
    mode = "on"
}

data "cloudflare_waf_groups" "owaspURIXSS" {
    zone_id = var.cloudflare_zone_id
    filter {
        name = "OWASP Uri XSS Attacks"
    }
}

resource "cloudflare_waf_group" "owaspURIXSS" {
    group_id = data.cloudflare_waf_groups.owaspURIXSS.groups.0.id
    zone_id = var.cloudflare_zone_id
    mode = "on"
}

## Adjusting individual rule behavior
resource "cloudflare_waf_rule" "waf_rule_100000356" {
    rule_id = "100000356"
    zone_id = var.cloudflare_zone_id
    mode = "off"
}

resource "cloudflare_waf_rule" "waf_rule_URI-958000" {
    rule_id = "URI-958000"
    zone_id = var.cloudflare_zone_id
    mode = "off"
}

# Cloudflare Managed Rulesets
### Data object for group_id variable
data "cloudflare_waf_groups" "drupal" {
    zone_id = var.cloudflare_zone_id
    filter {
        name = "Cloudflare Drupal"
    }
}
### Adjusts Cloudflare Drupal rule group to Off
resource "cloudflare_waf_group" "drupal" {
    group_id = data.cloudflare_waf_groups.drupal.groups.0.id
    zone_id = var.cloudflare_zone_id
    mode = "off"
}

data "cloudflare_waf_groups" "flash" {
    zone_id = var.cloudflare_zone_id
    filter {
        name = "Cloudflare Flash"
    }
}

resource "cloudflare_waf_group" "flash" {
    group_id = data.cloudflare_waf_groups.flash.groups.0.id
    zone_id = var.cloudflare_zone_id
    mode = "off"
}

data "cloudflare_waf_groups" "misc" {
    zone_id = var.cloudflare_zone_id
    filter {
        name = "Cloudflare Miscellaneous"
    }
}

resource "cloudflare_waf_group" "misc" {
    group_id = data.cloudflare_waf_groups.misc.groups.0.id
    zone_id = var.cloudflare_zone_id
    mode = "on"
}

## Adjusting individual rule behavior
resource "cloudflare_waf_rule" "waf_rule_100000" {
    rule_id = "100000"
    zone_id = var.cloudflare_zone_id
    mode = "simulate"
}

resource "cloudflare_waf_rule" "waf_rule_100015" {
    rule_id = "100015"
    zone_id = var.cloudflare_zone_id
    mode = "challenge"
}
