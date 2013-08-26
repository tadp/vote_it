class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #If you want a helper method available in BOTH the controller and the views, then you would set a helper method like this:
  
  # helper_method :fix_url
  # def fix_url
  # end

end
