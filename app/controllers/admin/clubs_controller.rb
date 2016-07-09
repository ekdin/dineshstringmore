class Admin::ClubsController<AdminController

	def index

		@clubs=Club.all		


	end	

	def new
		@club=Club.new

	end

	def edit
		
		@club=Club.find_by(params[:id])
	end

	def create
		@club=Club.new(club_params)
		@club.save
		redirect_to admin_clubs_url
	end

	def update

		@club=Club.find_by(params[:id])
		@club.update(club_params)
		redirect_to admin_clubs_url
	end

	def destroy
		@club=Club.find_by(params[:id])
		@club.destroy
		redirect_to admin_clubs_url
	end

	private
	  def club_params
     	 params.require(:club).permit(:name,:club_pic,:interest_id,:status,:description).merge(:user_id=>current_user.id)
      end
	

end