resource "digitalocean_app" "digitalocean-app" {
  spec {
    name   = var.do_app_name
    region = var.do_region
    service {
      name           = var.do_app_name
      http_port      = 3000
      instance_count = 1
      # doctl apps tier instance-size list
      instance_size_slug = "basic-xxs"

      image {
        registry_type = "DOCR"
        registry      = var.registry_name
        repository    = var.do_repo_name
        tag           = "latest"
        deploy_on_push {
          enabled = true
        }
      }

      env {
        key   = "DOPPLER_TOKEN"
        value = var.app_doppler_token
        scope = "RUN_TIME"
        type  = "SECRET"
      }

      env {
        key   = "DOPPLER_PROJECT_NAME"
        value = var.app_doppler_project_name
        scope = "RUN_TIME"
        type  = "GENERAL"
      }

      env {
        key   = "DOPPLER_PRD_CONF_NAME"
        value = var.app_doppler_prd_conf_name
        scope = "RUN_TIME"
        type  = "GENERAL"
      }



    }
  }
}

output "app_console" {
  description = "App console"
  value       = "https://cloud.digitalocean.com/apps/${digitalocean_app.digitalocean-app.id}"
}

output "app_live_url" {
  description = "App live URL"
  value = digitalocean_app.digitalocean-app.live_url
}

output "app_default_ingress" {
  description = "Default ingress"
  value = digitalocean_app.digitalocean-app.default_ingress
}
