class Admin::RolesController < AdminController

	def index

		@roles=Role.all
		
	end
	def new
		@role=Role.new

	end
	def create
		@role=Role.new(role_params)
		@role.save
		redirect_to admin_roles_url
		
	end
	def edit
		@role=Role.find_by(:id=>params[:id])

	end
	def update
		@role=Role.find_by(:id=>params[:id])
		@role.update(role_params)
		redirect_to admin_roles_url
		
	end
	def destroy
		@role=Role.find_by(:id=>params[:id])
		@role.destroy
		redirect_to admin_roles_url
		
	end

	private
	 def role_params
			
			params.require(:role).permit(:name)
	 	
	 end




end