class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find(params[:user_id])
    @post = Post.where(user: @user)
  end

  def show
    @post = Post.find(params[:id])
  end
end
