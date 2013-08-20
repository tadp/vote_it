class PostsController < ApplicationController
  def index
  	@post=Post.all

 def show
 end


  def new
  end

  def create
  end

  def edit
  	@user= params[:id]
  end

  def update
  end

end

