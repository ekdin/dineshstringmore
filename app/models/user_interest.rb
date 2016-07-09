class UserInterest< ActiveRecord::Base
belongs_to :user, class_name: 'User'
belongs_to :interest, class_name: 'Interest'
validates :user_id, presence: true
validates :interest_id,  presence: true

end