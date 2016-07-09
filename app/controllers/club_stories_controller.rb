class ClubStoriesController<ApplicationController
def create
	
	
	clubstory=Story.new(story_params)
	clubstory.save
	@story=Story.find(clubstory.id)


end

def destory
	
end
def getclubstories

      @clubfeed={

                   	stories: Story.joins(' inner join clubs on clubs.id= stories.club_id').where(:club_id=>params[:id]).order(:created_at=>'desc').page(params[:page]).per(5)
                }
      @url='/club_story/'+params[:id].to_s+'/getclubstories?&page='+(params[:page].to_i+1).to_s
      @pageid=params[:page]
      respond_to do |format|

        format.js

      end 

end  

def getuserclubstories

      @user=User.find(params[:id])
      @club_ids=@user.clubs.pluck(:id)  
      @clubfeed={

                    stories: Story.joins(' inner join clubs on clubs.id= stories.club_id').where('stories.club_id in (?)',@club_ids).order(:created_at=>'desc').page(params[:page]).per(5)
                }
      @url='/club_story/'+params[:id].to_s+'/getuserclubstories?&page='+(params[:page].to_i+1).to_s
      @pageid=params[:page]
      respond_to do |format|

        format.js

      end 

end  

  def story
    @club=Club.find(params[:id])
    @story=Story.find(params[:sid])
    
  end


private
 def story_params
 	params.require(:story).permit(:club_id,:title, contents_attributes: [:story_id, :content,:content_type,:content_pic,:position]).merge(:user_id=>current_user.id,:status=>1);

end

end
