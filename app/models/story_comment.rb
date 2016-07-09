class StoryComment<ActiveRecord::Base

 belongs_to :story, class_name: 'Story'
 belongs_to :user, class_name: 'User'
 has_attached_file :comment_pic,
      styles: { mini: '100x100>', normal: '320x320>', large: '500x500>' },
      default_style: :normal,
      url: '/spree/comment_pic/:id/:style/:basename.:extension',
      path: '/spree/comment_pic/:id/:style/:basename.:extension',
      default_url: '/default_club.jpg',
      convert_options: { all: '-strip -auto-orient -colorspace sRGB' },
      s3_headers: { 'Cache-Control' => 'max-age=315576000', 'Expires' => 1.year.from_now.httpdate }

    attachment_definitions[:comment_pic].merge!(ATTACHMENT_CONFIG)

    validates_attachment :comment_pic,
      content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end	