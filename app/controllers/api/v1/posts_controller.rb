class Api::V1::PostsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @posts = current_user.posts
    render json: @posts
  end
end
