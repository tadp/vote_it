class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find(params[:post_id])
    # @comment=Comment.new(body: params[:comment][:body])
    @comment=Comment.new(params.require(:comment).permit(:body))
    @comment.post= @post
    @comment.creator = current_user

    if @comment.save
      flash[:notice]= "You created a comment!"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

def vote
   @comment = Comment.find(params[:id])
  cvote= Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
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


end
