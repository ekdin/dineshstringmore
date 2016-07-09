class Admin::RolesUsersController< AdminController

	def index

		@users=User.all
		
	end

	def new
		
		@roles_user=RolesUser.new

	end
	def create
		@roles_user=RolesUser.new(roles_user_params)
		@roles_user.save
		redirect_to admin_roles_users_url
	end

	def edit


	end

	def update
		@roles_user=RolesUser.find_by(:id=>params[:id])
		@roles_user.update(roles_user_params)
		redirect_to admin_roles_users_url

	end	
	
	def destroy
		@roles_user=RolesUser.find_by(:id=>params[:id])
		@roles_user.destroy
	end	
	private
	 def roles_user_params

	 	params.require(:roles_user).permit(:user_id,:role_id)
	 	
	 end



end
