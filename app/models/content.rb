class Content<ActiveRecord::Base
	
   has_attached_file :content_pic,
      styles: { mini: '200x200>', normal: '500x500>' },
      default_style: :mini,
      url: '/spree/contents/:id/:style/:basename.:extension',
      path: '/spree/contents/:id/:style/:basename.:extension',
      default_url: '/default_content.png',
      convert_options: { all: '-strip -auto-orient -colorspace sRGB' },
      s3_headers: { 'Cache-Control' => 'max-age=315576000', 'Expires' => 1.year.from_now.httpdate }

    attachment_definitions[:content_pic].merge!(ATTACHMENT_CONFIG)
    validates_attachment :content_pic, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end