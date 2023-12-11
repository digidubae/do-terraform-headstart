# variable "my_public_ip_address" {
#   type     = string
#   nullable = false
# }

# resource "digitalocean_database_cluster" "mysql-cluster" {
#   name       = "deliverit"
#   engine     = "mysql"
#   version    = "8"
#   size       = "db-s-1vcpu-1gb"
#   region     = var.do_region
#   node_count = 1
#   # lifecycle {
#   #   prevent_destroy = true
#   # }
# }

# resource "digitalocean_database_firewall" "db-fw" {
#   cluster_id = digitalocean_database_cluster.mysql-cluster.id

#   rule {
#     type  = "app"
#     value = digitalocean_app.digitalocean-app.id
#   }

#   rule {
#     type  = "ip_addr"
#     value = var.my_public_ip_address
#   }

# }



# output "db_console" {
#   description = "Database console"
#   value       = "https://cloud.digitalocean.com/databases/${digitalocean_database_cluster.mysql-cluster.id}"
# }

# output "db_name" {
#   description = "Database name"
#   value       = digitalocean_database_cluster.mysql-cluster.name
# }

# output "db_host" {
#   description = "Database host"
#   value       = digitalocean_database_cluster.mysql-cluster.host
# }

# output "db_port" {
#   description = "Database port"
#   value       = digitalocean_database_cluster.mysql-cluster.port
# }

# output "db_user" {
#   description = "Database username"
#   value       = digitalocean_database_cluster.mysql-cluster.user
# }

# output "db_password" {
#   description = "Database password"
#   value       = digitalocean_database_cluster.mysql-cluster.password
#   sensitive = true
# }


