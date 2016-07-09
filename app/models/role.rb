class Role < ActiveRecord::Base
	has_many :rolesusers, class_name: 'Role_User'
	has_many :users, class_name: 'User', through: :rolesusers

end
