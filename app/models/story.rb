class Story< ActiveRecord::Base
 belongs_to :user, class_name: 'User'
 belongs_to :club, class_name: 'Club'
 has_many :contents, class_name: 'Content',:dependent => :destroy
 has_many :storycomments, class_name:'StoryComment', :dependent => :destroy
 has_many :storyratings, class_name: 'StoryRating',:dependent => :destroy
 validates :title, :user_id, :club_id, presence: true
 validates :contents, presence: true



 accepts_nested_attributes_for :contents, allow_destroy: true, reject_if: -> (params) { params[:content_pic].blank? && params[:content].blank? }

end
