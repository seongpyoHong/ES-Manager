variable "project_id" {
  type = string
  default= "project-id"
}
variable "cluster_name" {
  type = string
  default = "cluster-name"
}
variable "ssd_node_spec" {
  type = string
  default = "n1-standard-1"
}

variable "hdd_node_spec" {
  type = string
  default = "n1-standard-1"
}

variable "default_node_spec" {
  type = string
  default = "n1-standard-1"
}

variable "node_region" {
  type = string
  default = "asia-northeast3"
}
