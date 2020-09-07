provider "google" {
  credentials = file(format("./credential/${var.project_id}.json"))
  project = var.project_id
  region = "asia-northeast3"
}
