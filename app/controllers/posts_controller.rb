class PostsController < ApplicationController

def index
	@posts=Post.all
end

def show
  @users=User.all
end


def new
  @users=User.all
end

def create
end

def edit
	@user= params[:id]
end

def update
end

end

