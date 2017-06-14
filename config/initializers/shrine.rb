require "shrine/storage/s3"

s3_options = {
  access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  region:            ENV['AWS_REGION'],
  bucket:            ENV['AWS_BUCKET'],
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(prefix: "store", **s3_options),
}

Shrine.plugin :activerecord
Shrine.plugin :direct_upload
Shrine.plugin :restore_cached_data
Shrine.plugin :determine_mime_type
