resource "cloudflare_rate_limit" "api" {
  zone_id = var.cloudflare_zone_id
  threshold = 10
  period = 30
  match {
    request {
      url_pattern = "api.${var.cloudflare_zone}/*"
      schemes = ["HTTP", "HTTPS"]
    }
    response {
      statuses = [200, 201, 202, 301, 429]
      origin_traffic = false
    }
  }
  action {
    mode = "ban"
    timeout = 60
    response {
      content_type = "text/plain"
      body = "Exceeded rate limit threshold"
    }
  }
  disabled = false
  description = "API Rate Limit Demo"
  bypass_url_patterns = ["api.${var.cloudflare_zone}/bypass1","api.${var.cloudflare_zone}/bypass2"]
}