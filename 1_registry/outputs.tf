output "registry_endpoint" {
  description = "Registry url"
  value       = digitalocean_container_registry.registry.endpoint
}