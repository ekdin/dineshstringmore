class Interest < ActiveRecord::Base

has_many :clubs, class_name: 'Club', :dependent => :destroy
has_one :user_interest, class_name: 'UserInterest' 
has_many :users, class_name: 'User', through: :user_interest

has_attached_file :interest_pic,
      styles: { mini: '100x100>', normal: '320x320>', large: '500x500>' },
      default_style: :mini,
      url: '/spree/interests_pic/:id/:style/:basename.:extension',
      path: '/spree/interests_pic/:id/:style/:basename.:extension',
      default_url: '/default_interset.jpg',
      convert_options: { all: '-strip -auto-orient -colorspace sRGB' },
      s3_headers: { 'Cache-Control' => 'max-age=315576000', 'Expires' => 1.year.from_now.httpdate }

    attachment_definitions[:interest_pic].merge!(ATTACHMENT_CONFIG)

    validates_attachment :interest_pic,
      content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end