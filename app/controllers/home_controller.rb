class HomeController < ApplicationController
#skip_before_action :verify_interests
  def index
  		@pageid=1
    unless user_signed_in?

    	@clubs=Club.all.order('RAND()').limit(4)
    	@club_feed=
    	{
    		stories: Story.joins(' inner join clubs on stories.club_id=clubs.id ').order('stories.created_at desc').page(@pageid).per(1),
    		questions: ClubQuestion.joins(' inner join clubs on clubs.id=club_questions.club_id ' ).order('club_questions.created_at desc').page(@pageid).per(1)	
    	}


  		
  	end

  	 if user_signed_in?

  	 	@clubs=Club.joins('inner join user_clubs on user_clubs.club_id=clubs.id').where('user_clubs.user_id=?',current_user.id).order('RAND()').limit(4)
  	    		
  	 end
  	  	 @story=Story.new
         content = @story.contents.build	

  end

end
