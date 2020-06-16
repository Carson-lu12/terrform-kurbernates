variable "gke_name" {
  default = "demo-cluster"
}
variable "gke_project" {
  default = "myproject-280503"
}

variable "zone" {
  default = "asia-southeast1"
}

variable "initial_node_count" {
  default = 1
}

variable "machine_type" {
  default = "n1-standard-1"
}