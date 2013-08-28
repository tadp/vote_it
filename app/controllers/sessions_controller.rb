class SessionsController < ApplicationController

  def new
  end

  def create
    #get a handle on the user (username)
      #session 5 part 2, 44min
      user = User.find_by(username: params[:username])

    #call "authenticate" on that user, pass in the password
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, you're logged in!"
      redirect_to root_path
    else
      flash[:error] = "Sorry, something's wrong with your username or password."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You logged out."
    redirect_to root_path
  end

end

