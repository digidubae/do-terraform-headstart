resource "digitalocean_project" "do_project" {
  name        = var.do_project_name
  description = "Deliverit infrastructure"
  resources = [
    digitalocean_app.digitalocean-app.urn,
    # digitalocean_database_cluster.mysql-cluster.urn
  ]
  depends_on = [
    digitalocean_app.digitalocean-app,
    # digitalocean_database_cluster.mysql-cluster
  ]
}

output "project_console" {
  description = "Project console"
  value       = "https://cloud.digitalocean.com/projects/${digitalocean_project.do_project.id}"
}

