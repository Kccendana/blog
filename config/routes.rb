Rails.application.routes.draw do
  get '/sign_out_user', to: 'users#sign_out_user', as: 'sign_out_user'
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create] # Plural resources for handling likes
    end
  end
  root 'users#index'
  namespace :api, default: {format: :json} do
    namespace :v1 do
      resources :posts, only: %i[index] do
        resources :comments, only: %i[index create]
      end
    end
  end
end
