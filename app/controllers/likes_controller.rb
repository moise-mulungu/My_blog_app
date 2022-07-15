class LikesController < ApplicationController
    def new
        @like = Like.new
    end

    def create
        @like = Like.new(like_params)
        @post = Post.find(params[:post_id])
        @like = @post.likes.new(author_id: current_user.id, post_id: params[:post_id])
    
        if @like.save
            redirect_to user_posts_path(user_id: @post.author_id, id: @post.id)
        else
            render :new, alert: "Like failed to save."
        end
    end
end
