/*
# Description:
  This module creates a Kubernetes Service Account.

*/

/*
# Example Provider Configuration:
provider "kubernetes" {
  host = "https://cluster_endpoint:port"

  client_certificate     = file("~/.kube/client-cert.pem")
  client_key             = file("~/.kube/client-key.pem")
  cluster_ca_certificate = file("~/.kube/cluster-ca-cert.pem")
}

provider "kubernetes" {
  host                   = var.cluster_endpoint
  cluster_ca_certificate = base64decode(var.cluster_ca_cert)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
    command     = "aws"
  }
}
*/
locals {
    service_account_name = "${var.app}-service-account"
}

data "aws_eks_cluster" "eks" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "eks_auth" {
  name = var.cluster_name
}

resource "kubernetes_service_account" "service_account" {
  metadata {
    name = local.service_account_name


    labels = var.labels

  }
  secret {
    name = "${kubernetes_secret.service_account_secret.metadata.0.name}"
  }

}

resource "kubernetes_secret" "service_account_secret" {
  metadata {
    name = local.service_account_name
  }
}