output "service_account_name" {
  value = kubernetes_service_account.service_account.metadata.0.name
}

output "secret_name" {
  value = kubernetes_secret.service_account_secret.metadata.0.name
}

