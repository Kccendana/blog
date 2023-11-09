class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, :author)
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

  def destroy
    @post = Post.includes(:likes).find(params[:id])
    @author = @post.author
    @author.decrement!(:posts_counter)
    @post.likes.destroy_all
    @post.destroy!

    redirect_to user_posts_path(id: @author.id), notice: 'Post successfully deleted'
  end

  private

  def post_params
    params.require(:post).permit(:@user, :title, :text)
  end
end
