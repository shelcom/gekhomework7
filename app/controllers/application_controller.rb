class ApplicationController < ActionController::Base
	 helper_method :current_user
  
  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end 
 
   
def require_admin
   redirect_to '/' unless current_user.admin
end

end
