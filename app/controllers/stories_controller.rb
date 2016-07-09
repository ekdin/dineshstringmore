class StoriesContoller<ApplicationController

def create
	
	puts params[:story]

	@story=Story.new(story_params)
	@story.save

end

def destory
	
end
private
 def story_params
 	params.require(:story).permit(:club_id, contents_attributes: [:story_id, :content,:content_type,:content_pic,:position]).merge(:user_id=>current_user.id,:status=>1);

end


end	