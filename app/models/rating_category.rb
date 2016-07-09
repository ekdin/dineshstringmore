class RatingCategory<ActiveRecord::Base
validates :name, presence: true, uniqueness: true
has_many :storyratings, class_name: 'StoryRating', :dependent => :destroy
has_many :users, class_name: 'User', through: :storyratings
has_many :stories, class_name: 'Story', through: :storyratings



end