require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'assigns @users' do
      user = User.create(name: 'Ben', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
      get :index
      expect(assigns(:users)).to eq([user])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'assigns @user' do
      user = User.create(name: 'Kyla', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end

    it 'renders the show template' do
      user = User.create(name: 'Test3', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher3 from Poland.')
      get :show, params: { id: user.id }
      expect(response).to render_template('show')
    end
  end
end
