class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find(params[:post_id])
    # @comment=Comment.new(body: params[:comment][:body])
    @comment=Comment.new(params.require(:comment).permit(:body))
    @comment.post= @post
    @comment.user = current_user

    if @comment.save
      flash[:notice]= "You created a comment!"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end


  private

end
