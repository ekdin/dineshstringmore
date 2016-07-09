class UserProfileController < ApplicationController
    include ClubFeed


  def profile
    @current_page=0
    @user=User.find_by(:uname=>params[:uname])
    @clubs=@user.clubs
    @clubs_id=@user.clubs.pluck(:id)
    @story=Story.new
    content = @story.contents.build
    user_club_feed(@current_page,@clubs_id)

    
    
  end
  def savename

      @user=User.find(params[:id])
      @user.update(user_params)

     respond_to do |format|
        format.js
       end 
    
  end

  def getfollower
    @user=User.find_by(:uname=>params[:uname])
    @pageid=params[:page]
    @userfeed={
      followers: @user.followers.page(params[:page]).per(5)
    }
    @url='/users/'+params[:uname]+'/getfollower?page='+(params[:page].to_i+1).to_s
    respond_to do |format|
        format.js
    end 

    
  end

  def getfollowing
      @user=User.find_by(:uname=>params[:uname])
    @pageid=params[:page]
    @userfeed={
      followings: @user.followings.page(params[:page]).per(5)
    }
    @url='/users/'+params[:uname]+'/getfollowing?page='+(params[:page].to_i+1).to_s
    respond_to do |format|
        format.js
    end 
  end

  

  private 
    def user_params
      params.require(:user).permit(:name,:bio,:user_profile_pic)
      
    end
 
end