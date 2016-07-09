class ClubsController<ApplicationController
	include ClubFeed


	def show
		@current_page=0
		
		@club=Club.find(params[:id])
		@story=Story.new
   		content = @story.contents.build
		user_open_club_feed(params[:id],@current_page)
	# @clubfeed[:stories]

	end

	def questions
			@current_page=0
		
		@club=Club.find(params[:id])
		
		user_open_club_feed(params[:id],@current_page)
			
	end	
	def stories
   		@current_page=0
		@club=Club.find(params[:id])
		@story=Story.new
   		content = @story.contents.build
		user_open_club_feed(params[:id],@current_page)
	end

	def showquestions

	end	
	def showstories

	end	
	def get_club_page
		@pageid=params[:page]
		user_open_club_feed(params[:id],@pageid)
		@current_page=params[:page].to_i+1;
		@url='/clubs/'+params[:id].to_s+'/'+params[:name]+'/get_club_page'+'?page='+@current_page.to_s
		
		
	end

	def get_user_club_page
	    @pageid=params[:page]
	    @user=User.find_by(:id=>params[:id])
	    @clubs=@user.clubs
	    @clubs_id=@user.clubs.pluck(:id)
	    user_club_feed(@pageid,@clubs_id)
	    @current_page=params[:page].to_i+1;
	    @url='/clubs/'+params[:id].to_s+'/'+@user.uname+'/get_user_club_page'+'?page='+@current_page.to_s
    end

    def getclubmember

      @club=Club.find(params[:id])
      	
      @clubfeed={

                   	members: @club.users.order(:created_at=>'desc').page(params[:page]).per(5)
                }
      @url='/clubs/'+params[:id].to_s+'/'+params[:name]+'/getclubmember?&page='+(params[:page].to_i+1).to_s
      @pageid=params[:page]
      respond_to do |format|

        format.js

      end 
   end   




end