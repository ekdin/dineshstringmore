# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

attachment_config = {
  s3_credentials: {
    access_key_id: S3_CREDENTIALS['AWS_ACCESS_KEY'],
    secret_access_key: S3_CREDENTIALS['AWS_SECRET_TOKEN'],
    bucket: S3_CREDENTIALS['AWS_BUCKET']
  },

  storage:        :s3,
  s3_protocol:    "http"
}

ATTACHMENT_CONFIG = attachment_config

Paperclip::Attachment.default_options[:s3_protocol] = "http"
Paperclip.options[:command_path] = Rails.application.secrets.paperclip_command_path


