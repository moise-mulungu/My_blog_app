class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author: current_user)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    @post.likes_counter = 0
    @post.comment_counter = 0

    if @post.save
      redirect_to user_path(id: @post.author_id)
    else
      render :new, alert: 'Post failed to save.'
    end
  end

  def post_params
    params.permit(:title, :text)
  end
end
