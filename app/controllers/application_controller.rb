class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # If you want a helper method available in BOTH the controller and the views, then you would set a helper method like this:
  
  helper_method :fix_url
  def fix_url(url)
    if url.starts_with?('http')
      url
    else
      "http://www." + url
    end
  end

  helper_method :current_user, :logged_in?


  def current_user
    #memoization. It is saved into an instance variable. Doesn't hit the database multiple times.
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:error] = "Must be logged in to do that"
      redirect_to root_path
    end
  end
  
  def access_denied
    flash[:error] = "You can't do that"
    redirect_to root_path
  end

end

