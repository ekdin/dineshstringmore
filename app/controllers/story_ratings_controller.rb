class StoryRatingsController<ApplicationController


	def rate
		ratingobj=StoryRating.where(:user_id=>current_user.id,:story_id=>params[:story_id],:rate_category_id=>params[:rate_category_id])
		story_rating={
			story_id:params[:story_id],
			rate_category_id:params[:rate_category_id],
			rate:params[:rate],
			user_id:current_user.id

		}
		if ratingobj.count==0

			rating=StoryRating.new(story_rating)
			rating.save
			@story=Story.find(rating.story_id)
		else
			ratingobj.each do |robj|

			rating=StoryRating.find(robj.id)	
			rating.update(story_rating)
			@story=Story.find(robj.story_id)
			@id= robj.story_id
			end	
			
			
		end
		
		respond_to do |format|
		  format.js	
		end	
		
	end

	def unrate
		StoryRating.find(params[:id])
		StoryRating.destroy
		@story=Story.find(params[:story_id])
		respond_to do |format|
			format.js
		end	
	end

			



end