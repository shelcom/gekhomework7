class HomeController < ApplicationController
  def logged_in_user
          unless !current_user.nil?
            redirect_to users_url
          end
        end
end
