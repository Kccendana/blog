require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:user) { User.create(name: 'Ben', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.') }
  let!(:post) do
    user.posts.create(title: 'Test Post', text: 'This is a test post.', comments_counter: 0, likes_counter: 0)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: { user_id: user.id }
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index, params: { user_id: user.id }
      expect(response).to render_template('index')
    end

    it 'assigns @posts' do
      get :index, params: { user_id: user.id }
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { user_id: user.id, id: post.id }
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get :show, params: { user_id: user.id, id: post.id }
      expect(response).to render_template('show')
    end

    it 'assigns @post' do
      get :show, params: { user_id: user.id, id: post.id }
      expect(assigns(:post)).to eq(post)
    end
  end
end
