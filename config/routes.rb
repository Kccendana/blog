Rails.application.routes.draw do
  # get 'comments/index'
  # get 'comments/new'
  # get 'comments/create'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      post 'like', on: :member
      # post 'like', to: 'posts#like'
    end
  end
  root 'users#index'
end
