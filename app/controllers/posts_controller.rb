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
  # @post = Post.new(params.require(:post).permit!)
  # Added in private method below
  @post = Post.new(post_params)
  if @post.save
    flash[:notice] = "You created a new post!"
    # redirect_to posts_path, notice: "Another syntax"
    redirect_to posts_path
  else
    #handle validations
    render :new
  end
end

def edit
	@user= params[:id]
end

def update

end

def destroy
@post=Post.find(params[:id])
@post.destroy
  respond_to do |format|
    format.html { redirect_to posts_path }
    format.json { head :no_content }
  end
end


private

def post_params
  params.require(:post).permit(:title, :url)
end

end

