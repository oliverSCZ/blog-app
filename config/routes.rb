Rails.application.routes.draw do 
  devise_for :users

  get "/users/:user_id/posts/:post_id/likes", to: "likes#create"
  get "/delete/post/:post_id", to: "posts#destroy"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      
    end
  end
  
  get 'api/users/:user_id', to: 'api#user_posts'
  get 'api/users/:user_id/posts/:post_id/comments', to: 'api#user_comments'
  
  namespace :api, defaults: { format: :json} do
    post 'users/register', to: 'authentication#register'
    post 'users/login', to: 'authentication#login'
    get 'api/users/:user_id', to: 'api#user_posts'
    get 'comments', to: 'api#list_comments'
    post 'new_comment', to: 'api#create_comment'
  end
  
  root 'users#index'
  
end 
