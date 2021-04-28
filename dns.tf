# DNS Records
resource "cloudflare_record" "apex" {
    zone_id = var.cloudflare_zone_id
    name    = var.cloudflare_zone
    value   = "142.250.64.100"
    type    = "A"
    proxied = true
}

resource "cloudflare_record" "api" {
    zone_id = var.cloudflare_zone_id
    name    = "api"
    value   = "34.199.75.4"
    type    = "A"
    proxied = true
}

resource "cloudflare_record" "internal" {
    zone_id = var.cloudflare_zone_id
    name    = "internal"
    value   = "10.0.0.1"
    type    = "A"
}

resource "cloudflare_record" "bing" {
    zone_id = var.cloudflare_zone_id
    name    = "bing"
    value   = "204.79.197.200"
    type    = "A"
    proxied = true
}

resource "cloudflare_record" "wild" {
    zone_id = var.cloudflare_zone_id
    name    = "*"
    value   = "34.199.75.4"
    type    = "A"
    proxied = true
}