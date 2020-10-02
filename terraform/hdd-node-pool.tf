resource "google_container_node_pool" "hdd_nodes" {
  name       = "hdd-node-pool"
  location   = var.node_region
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = var.hdd_node_spec

    metadata = {
      disable-legacy-endpoints = "true"
    }
    disk_type = "pd-standard"
    disk_size_gb = 30
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/compute",
    ]
  }
}