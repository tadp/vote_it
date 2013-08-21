class PostsController < ApplicationController

def index
	@posts=Post.all
end

def show
  @post = Post.find(params[:id])
end


def new
  @post = Post.new

end

def create
  post = Post.new(params.require(:post).permit!)

  if post.save
    flash[:notice] = "You created a new post!"
    # redirect_to posts_path, notice: "Another syntax"
    redirect_to posts_path
  else
    #handle validations
    render
  end
end

def edit
	@user= params[:id]
end

def update
end

end

