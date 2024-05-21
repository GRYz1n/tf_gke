terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.52.0"
    }
  }

  backend "gcs" {
    bucket = "terraf0rm"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.GOOGLE_PROJECT
  region  = var.GOOGLE_REGION
  # zone    = "us-central1-c"
}

# data "google_compute_instance_group_manager" "node_instance_group_manager" {
#   name = google_container_cluster.demo.node_pool[0].name
# }

# output "node_ip" {
#   value = [
#     for instance in data.google_compute_instance_group_manager.node_instance_group_manager :
#     instance.instance_template.network_interface[0].access_config[0].nat_ip
#   ]
# }

module "kind_cluster" {
  source = "github.com/den-vasyliev/tf-kind-cluster?ref=cert_auth"
}

resource "google_container_cluster" "demo" {
  name                     = "demo"
  location                 = var.GOOGLE_REGION
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "main" {
  name       = "main"
  project    = google_container_cluster.demo.project
  cluster    = google_container_cluster.demo.name
  location   = google_container_cluster.demo.location
  node_count = var.GKE_NUM_NODES

  node_config {
    machine_type = var.GKE_MACHINE_TYPE
  }
}
