# Obtain current home IP address
data "http" "ipv4" {
  url = "http://ipv4.icanhazip.com"
}

#
# Base records
#

# Record which will be updated by DDNS
resource "cloudflare_record" "apex_ipv4" {
  name    = "dyn"
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = chomp(data.http.ipv4.body)
  proxied = false
  type    = "A"
  ttl     = 1
}

#
resource "cloudflare_record" "apex_ipv6" {
  name    = "dyn"
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = "${data.sops_file.cloudflare_secrets.data["ingress_ipv6"]}"
  proxied = false
  type    = "AAAA"
  ttl     = 1
}

resource "cloudflare_record" "cname_root" {
  name    = data.sops_file.cloudflare_secrets.data["cloudflare_domain"]
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = "dyn.${data.sops_file.cloudflare_secrets.data["cloudflare_domain"]}"
  proxied = false
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "cname_www" {
  name    = "www"
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = "dyn.${data.sops_file.cloudflare_secrets.data["cloudflare_domain"]}"
  proxied = false
  type    = "CNAME"
  ttl     = 1
}

#
# VPN records
#

# IPv4 record for vpn
resource "cloudflare_record" "vpn_ipv4" {
  name    = "vpn"
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = chomp(data.http.ipv4.body)
  proxied = false
  type    = "A"
  ttl     = 1
}

# IPv6 record for vpn
resource "cloudflare_record" "vpn_ipv6" {
  name    = "vpn"
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = "${data.sops_file.cloudflare_secrets.data["vpn_ipv6"]}"
  proxied = false
  type    = "AAAA"
  ttl     = 1
}

# IPv6 Only record for vpn
resource "cloudflare_record" "vpn6" {
  name    = "vpn6"
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = "${data.sops_file.cloudflare_secrets.data["vpn_ipv6"]}"
  proxied = false
  type    = "AAAA"
  ttl     = 1
}

#
# Apple iCloud+ custom domain email
#

resource "cloudflare_record" "cname_apple" {
  name    = "sig1._domainkey"
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = "sig1.dkim.${data.sops_file.cloudflare_secrets.data["cloudflare_domain"]}..at.icloudmailadmin.com"
  proxied = false
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "mx_apple_1" {
  name    = data.sops_file.cloudflare_secrets.data["cloudflare_domain"]
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = "mx01.mail.icloud.com"
  proxied = false
  type    = "MX"
  ttl     = 1
  priority = 10
}

resource "cloudflare_record" "mx_apple_2" {
  name    = data.sops_file.cloudflare_secrets.data["cloudflare_domain"]
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = "mx02.mail.icloud.com"
  proxied = false
  type    = "MX"
  ttl     = 1
  priority = 10
}

resource "cloudflare_record" "txt_apple_domain" {
  name    = data.sops_file.cloudflare_secrets.data["cloudflare_domain"]
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = "apple-domain=${data.sops_file.cloudflare_secrets.data["apple_domain"]}"
  proxied = false
  type    = "TXT"
  ttl     = 1
}

resource "cloudflare_record" "txt_spf" {
  name    = data.sops_file.cloudflare_secrets.data["cloudflare_domain"]
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = "v=spf1 redirect=icloud.com"
  proxied = false
  type    = "TXT"
  ttl     = 1
}

#
# Additional email records
#

resource "cloudflare_record" "txt_dmarc" {
  name    = "_dmarc"
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  value   = "v=DMARC1; p=none; rua=mailto:${data.sops_file.cloudflare_secrets.data["cloudflare_email"]}"
  proxied = false
  type    = "TXT"
  ttl     = 1
}
