class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)

    if @post.save
      redirect_to user_posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def like
    @post = Post.find(params[:id]) # Find the post
    @user = User.find(@post.author_id) # Find the user who authored the post

    @like = @post.likes.new(user: current_user)

    if @like.save
      redirect_to user_post_path(@user, @post), notice: 'Post liked successfully.'
    else
      redirect_to user_post_path(@user, @post), alert: 'Failed to like the post.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:@user, :title, :text)
  end
end
