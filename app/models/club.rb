class Club < ActiveRecord::Base

belongs_to :interest, class_name: 'Interest'
has_many :'userclubs', class_name: 'UserClub'
has_many :users, class_name: 'User', through: :userclubs
has_many :clubquestions, class_name: 'ClubQuestion', :dependent => :destroy
has_many :stories, class_name: 'Story', :dependent => :destroy
has_many :storycomments, class_name: 'StoryComment', :dependent => :destroy

validates :interest_id, presence: true
validates :name, presence: true, uniqueness: true

has_attached_file :club_pic,
      styles: { mini: '100x100>', normal: '320x320>', large: '500x500>' },
      default_style: :mini,
      url: '/spree/club_pic/:id/:style/:basename.:extension',
      path: '/spree/club_pic/:id/:style/:basename.:extension',
      default_url: '/default_club.jpg',
      convert_options: { all: '-strip -auto-orient -colorspace sRGB' },
      s3_headers: { 'Cache-Control' => 'max-age=315576000', 'Expires' => 1.year.from_now.httpdate }

    attachment_definitions[:club_pic].merge!(ATTACHMENT_CONFIG)

    validates_attachment :club_pic,
      content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end