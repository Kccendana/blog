require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET #index' do
    it 'returns a success response' do
      get user_posts_path(:user_id)
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get user_posts_path(:user_id)
      expect(response).to render_template('index')
    end

    it 'renders the right placeholder' do
      get user_posts_path(:user_id)
      expect(response.body).to include 'Here is a list of posts for a given user'
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get user_post_path(:user_id, :post_id)
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get user_post_path(:user_id, :post_id)
      expect(response).to render_template('show')
    end

    it 'renders the right placeholder' do
      get user_post_path(:user_id, :post_id)
      expect(response.body).to include 'Here is a list of posts for a given user'
    end
  end
end
