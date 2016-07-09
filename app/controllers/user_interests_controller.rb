class UserInterestsController< ApplicationController
layout 'interestlayout'
respond_to :html, :js
skip_before_action :verify_interests
   def interest

   	if current_user.nil? ==true

     	redirect_to root_url
   			
     else
     
     	@interests=Interest.all
     end
   	
   end

   def apply
	 @interests=params[:interests_id].split(',')

	 @interests.each do |row|
	 	interest=Hash.new 
	 	 interest[:interest_id]=row
	 	 interest[:user_id]=current_user.id
	 	 @interest=UserInterest.new(interest)
	 	 @interest.save
	 	 

	  end	
	  respond_to do |format|
	      
	     format.js
  	  end	

	end
   
end	