class UserClub < ActiveRecord::Base
 belongs_to :user, class_name: 'User'
 belongs_to :club, class_name: 'Club'
 end