output "bucket_url" {
  value = "gs://${google_storage_bucket.demo_bucket.name}"
}

output "ci_cd_test_message" {
  value = "Spacelift CI/CD pipeline is working!"
}
