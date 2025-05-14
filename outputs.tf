output "bucket_url" {
  value = "gs://${google_storage_bucket.demo_bucket.name}"
}
