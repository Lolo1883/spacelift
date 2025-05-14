output "kubeconfig_path" {
  value = local_file.kubeconfig.filename
}

output "registry_container_name" {
  value = docker_container.registry.name
}
