resource "google_storage_bucket" "static" {
  name          = "${var.bucket-name}"
  location      = "${var.region}"
  storage_class = "STANDARD"
  force_destroy = true

  uniform_bucket_level_access = true
}

#resource "google_storage_bucket_access_control" "public_rule" {
#  bucket = google_storage_bucket.static.name
#  role   = "storage.admin"
#  entity = "allUsers"
#}

resource "google_storage_bucket_iam_binding" "binding" {
  bucket = google_storage_bucket.static.name
  role = "roles/storage.objectViewer"
  members = [
    "allUsers",
  ]
}

output "bucket_url" {
  description = "URL of bucket"
  value = "https://storage.googleapis.com/${resource.google_storage_bucket.static.url}"
}
output "bucket_id" {
  description = "ID of bucket"
  value = "${resource.google_storage_bucket.static.id}"
}