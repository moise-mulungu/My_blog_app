class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author: @user)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @author = User.find(params[:user_id])
    @post = @author.posts.new(post_params)

    if @post.save
      redirect_to user_path(id: @post.author_id)
    else
      render :new, alert: "Post failed to save."
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
