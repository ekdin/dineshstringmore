class Admin::InterestsController<AdminController

	def index
  		 @interests=Interest.all
  	end	

	def new
	 	@interest=Interest.new
	end
 	def create
 		@interest=Interest.new(interest_params)
 		@interest.save
 		redirect_to admin_interests_url

 	end
 	def show
 		@interest=Interest.find_by(:id=>params[:id])
 	end

 	def edit
 		@interest=Interest.find_by(:id=>params[:id])
 	end

 	def update
 		@interest=Interest.find_by(:id=>params[:id])
 		@interest.update(interest_params)
 		redirect_to admin_interests_url

 	end
 	def destroy

 		@interest=Interest.find_by(:id=>params[:id])
 		@interest.destroy
 		redirect_to admin_interests_url


 	end


 private

  def interest_params
  	params.require(:interest).permit(:title,:status,:interest_pic)
  end	


end