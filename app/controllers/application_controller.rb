class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :verify_interests, :root_login_url, :after_sign_out_path_for
  before_action :verify_interests, if:-> {user_signed_in?}

  def root_login_url(params={})
      root_url(params) + '#login'
  end

  def verify_interests
    if current_user.email=='dinesh.singh@rianaa.com'

      else

         if current_user.user_interests.count<3
        

            redirect_to '/interest'

        end
    end
    
  

  end
  private
   def after_sign_out_path_for(resource_or_scope)
      request.referrer
   end


end
