#Project resources
resource "google_container_cluster" "default" {
  name = "${var.gke_name}}"
  project = "${var.gke_project}"
  description = "Demo GKE cluster"
  location = "${var.zone}"

#default remove node pool
remove_default_node_pool = true
initial_node_count = "${var.initial_node_count}"

#Authentication, if leave blank, no creditional is required
master_auth {
  username = ""
  password = ""

  clinet_certification_config {
    issue_client_certification = false
  }
 }
}

resource "google_container_node_pool" "default" {
  name = "${var.name}-node-pool"
  project = "${var.project}"
  location = "${var.location}"
  cluster = "${google_container_cluster.default.name}"
  node_count = 1

  node_config {
    #Something like spot instance in aws
    preemptible = true
    machine_type = "${var.machine_type}"

    metadata = {
      disable-legacy-endpoint = "true"
    }
    oauth_scopes = [
    "https://www.googleapis.com/auth/logging.write",
    "https://www.gooogleapis.com/auth/monitoring",
    ]
  }
}