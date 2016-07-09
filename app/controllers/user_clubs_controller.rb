class UserClubsController< ApplicationController


	def create
		user_club=Hash.new 
		user_club[:club_id]=params[:club_id]
		user_club[:user_id]=current_user.id
		@userclub=UserClub.new(user_club)
		@userclub.save	
		@club=Club.find(params[:club_id])
		respond_to do |format|
	     	format.js
  	     end			

	end


	def destroy
		@club=Club.find(params[:id])
		@userclub=UserClub.find_by(:club_id=>params[:id])
		@userclub.destroy
		 respond_to do |format|
	      
	     format.js
  	     end	

	end	

	def show
			
    end	

    def getuserclubs
    	@pageid=params[:page]
    	@user=User.find(params[:id])
    	@clubsfeed=
    	{
    		userclubfeed: @user.clubs.order(:created_at=>'desc').page(params[:page]).per(10)
    	}
    	@currentpage=params[:page].to_i+1;
    	@url='/user_club/'+params[:id].to_s+'/getuserclubs?&page='+@currentpage.to_s
    	
      	respond_to do |format|
				format.js
		end 

    end	

end