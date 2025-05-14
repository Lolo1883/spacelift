resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "demo_bucket" {
  name     = "spacelift-demo-bucket-${random_id.bucket_suffix.hex}"
  location = var.region
  force_destroy = true
}
