class AdminController < ApplicationController
  before_action :require_admin
  skip_before_action :verify_interests
  layout 'adminlayout'

  def require_admin
	  	if current_user.nil? ==true
			redirect_to root_url

	  	elsif current_user.roles_user.nil?
	  		redirect_to root_url

	  	elsif current_user.roles_user.role.nil?
	  		redirect_to root_url

	  	else	
	  				
	  				
	  		unless current_user.roles_user.role.name=='admin'
	      		redirect_to root_url
	   		 end	
	  	end
	    
  end
end