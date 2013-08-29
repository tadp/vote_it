class VotesController < ApplicationController
  def index
    @posts=Post.all
    @posts.sort_by! {|post| post.total_votes}.reverse!

    
  end

end


