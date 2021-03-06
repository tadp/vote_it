class PostsController < ApplicationController

before_action :set_post, only: [:show, :edit, :update, :vote]
before_action :require_user, only: [:new, :create, :edit, :update, :vote]
before_action :require_creator_or_admin, only: [:edit, :update]

def index
	@posts=Post.all
  @posts.sort_by! {|post| post.total_votes}.reverse!
end

def show
  @comment= Comment.new
end


def new
  @post = Post.new
end

def create
  # @post = Post.new(params.require(:post).permit!)
  # Added in private method below
  @post = Post.new(post_params)
  @post.creator = current_user
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
end

def update
  if @post.update(post_params)
    flash[:notice] = "You updated the post!"
    redirect_to post_path(@post)
  else
    render :edit
  end

end

def destroy
@post=Post.find(params[:id])
@post.destroy
  respond_to do |format|
    format.html { redirect_to posts_path }
    format.json { head :no_content }
  end
end

def vote
  # Vote.create(voteable: @post, creator: current_user, vote: params[:vote])
  # flash[:notice]="You successfully voted!"
  # redirect_to :back
  Vote.create(voteable: @post, creator: current_user, vote: params[:vote])
  
   respond_to do |format|
    format.html do
    flash[:notice] = "Your vote was counted"
    redirect_to :back
    end

    # format.js do
    #   render :vote # /posts/vote.js.erb.   This is the default action so we just need "format.js"
    # end
    format.js

  end

end




private

def post_params
  params.require(:post).permit(:title, :url)
end

def set_post
   @post = Post.find(params[:id])
   # @post = Post.find_by(slug: params[:id])
end

def require_creator_or_admin
  access_denied unless logged_in? && (@post.creator == current_user || current_user.admin?)
end

end

