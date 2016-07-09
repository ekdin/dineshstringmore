class StoryCommentsController<ApplicationController

def create
    story_comment=StoryComment.new(story_comment_params)
    story_comment.save
    @comment=StoryComment.find(story_comment.id)
    @qid=@comment.story_id
    
    respond_to do |format|
      format.js
    end
end

    private
    def story_comment_params
		params.require(:story_comment).permit(:story_id,:comment,:comment_pic).merge(:user_id=>current_user.id,:status=>1)		
	end

end