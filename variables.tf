variable "app" {
        description = "Application Name"
        type = string
        default = "test"
}

variable "cluster_name" {
        description = "EKS Cluster Name "
        type = string
        default = "test_cluster"
}

variable "aws_region" {
  description = "AWS Region"
    type = string
    default = "us-east-1"
}

variable "labels" {
  description = "Labels"
    type = map(string)
    default = {
        "app" = "test_app"
        "terraform" = "true"
    }
}
  
