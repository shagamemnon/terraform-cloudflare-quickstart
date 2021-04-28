resource "cloudflare_spectrum_application" "ssh_proxy" {
    zone_id      = var.cloudflare_zone_id
    protocol     = "tcp/22"
    traffic_type = "direct"
    dns {
        type = "CNAME"
        name = "ssh.${var.cloudflare_zone}"
    }

    origin_direct = [
        "tcp://204.79.197.200:22"
    ]
} 
