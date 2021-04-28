# Filters for Firewall Rules to use
resource "cloudflare_filter" "challenge" {
  zone_id = var.cloudflare_zone_id
  description = "Can be used to demo JS challnege at example.com/challenge."
  expression = "(http.host eq \"${var.cloudflare_zone}\" and http.request.uri.path eq \"/challenge\")"
}

resource "cloudflare_filter" "captcha" {
  zone_id = var.cloudflare_zone_id
  description = "Can be used to demo captcha at example.com/captcha."
  expression = "(http.host eq \"${var.cloudflare_zone}\" and http.request.uri.path eq \"/captcha\")"
}

resource "cloudflare_filter" "apiRLbypass" {
  zone_id = var.cloudflare_zone_id
  description = "Can be used to demo captcha at example.com/captcha."
  expression = "(http.host eq \"api.${var.cloudflare_zone}\") and (any(http.request.headers.values[*] contains \"bypass\"))"
}

# Firewall rules to use filters with
resource "cloudflare_firewall_rule" "challenge" {
  zone_id = var.cloudflare_zone_id
  description = "JS Challenge Demo"
  filter_id = cloudflare_filter.challenge.id
  action = "js_challenge"
}

resource "cloudflare_firewall_rule" "captcha" {
  zone_id = var.cloudflare_zone_id
  description = "Captcha Challenge Demo"
  filter_id = cloudflare_filter.captcha.id
  action = "challenge"
}

resource "cloudflare_firewall_rule" "apiRLbypass" {
  zone_id = var.cloudflare_zone_id
  description = "Bypass API Rate Limiting"
  filter_id = cloudflare_filter.apiRLbypass.id
  action = "bypass"
  products = [ "rateLimit" ]
}
