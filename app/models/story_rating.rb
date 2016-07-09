class StoryRating<ActiveRecord::Base
belongs_to :story, class_name: 'Story'
belongs_to :ratecategory, class_name: 'RateCategory'
belongs_to :user, class_name: 'User'



end	