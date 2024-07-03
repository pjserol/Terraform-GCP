# API Keys

resource "google_apikeys_key" "primary" {
  name         = "api-key-1"
  display_name = "Primary API Key"

  restrictions {
    api_targets {
      # service = "all"
      service = "translate.googleapis.com"
      methods = ["GET"]
    }

    browser_key_restrictions {
      allowed_referrers = [".*"]
    }
  }
}

# output key
output "api_key" {
  sensitive = true
  value     = google_apikeys_key.primary.key_string
}
