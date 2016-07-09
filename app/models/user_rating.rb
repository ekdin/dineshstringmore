class UserRating<ActiveRecord::Base
belongs_to :user, class_name: 'User'
belongs_to :story, class_name: 'Story' 



end	