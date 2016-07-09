class ClubQuestion<ActiveRecord::Base	
belongs_to :club, class_name: 'Club'
belongs_to :user, class_name:'User'
has_many :answers, class_name: 'Answer', :dependent => :destroy
has_attached_file :question_pic,
      styles: { mini: '100x100>', normal: '320x320>', large: '500x500>' },
      default_style: :mini,
      url: '/spree/question_pic/:id/:style/:basename.:extension',
      path: '/spree/question_pic/:id/:style/:basename.:extension',
      default_url: '/default_interset.jpg',
      convert_options: { all: '-strip -auto-orient -colorspace sRGB' },
      s3_headers: { 'Cache-Control' => 'max-age=315576000', 'Expires' => 1.year.from_now.httpdate }

    attachment_definitions[:question_pic].merge!(ATTACHMENT_CONFIG)

    validates_attachment :question_pic,
      content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

acts_as_votable
end
