Fog.credentials = { path_style: true }
AssetSync.configure do |config|
  config.fog_provider = 'AWS'
  config.fog_directory = S3_CREDENTIALS['AWS_BUCKET']
  config.fog_region = S3_CREDENTIALS['AWS_BUCKET_REGION']
  config.aws_access_key_id = S3_CREDENTIALS['AWS_ACCESS_KEY']
  config.aws_secret_access_key = S3_CREDENTIALS['AWS_SECRET_TOKEN']
  config.enabled = true
  config.aws_reduced_redundancy = true
  config.existing_remote_files = 'keep'
  config.gzip_compression = true
  config.manifest = false
  config.fail_silently = true
  config.custom_headers = { '.*' => { cache_control: 'max-age=315576000', expires: 1.year.from_now.httpdate } }
end
