class LikesController < ApplicationController
  def create
    # Logic to create a like
    @post = Post.find(params[:post_id])
    @user = User.find(@post.author_id) # Access the user who authored the post

    @like = @post.likes.new(user: current_user)

    if @like.save
      redirect_to user_post_path(@user, @post), notice: 'Post liked successfully.'
    else
      redirect_to user_post_path(@user, @post), alert: 'Failed to like the post.'
    end
  end
end
