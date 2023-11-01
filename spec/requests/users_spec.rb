require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    it 'returns a success response' do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template('index')
    end

    it 'renders the right placeholder' do
      get users_path
      expect(response.body).to include 'Here is a list of user'
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get user_path(:user_id)
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get user_path(:user_id)
      expect(response).to render_template('show')
    end

    it 'renders the right placeholder' do
      get user_path(:user_id)
      expect(response.body).to include 'Here is a list of user'
    end
  end
end
