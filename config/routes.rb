Rails.application.routes.draw do 
  devise_for :users

  get "/users/:user_id/posts/:post_id/likes", to: "likes#create"
  get "/delete/post/:post_id", to: "posts#destroy"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      
    end
  end
  
  root 'users#index'
  
end 
