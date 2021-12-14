Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', :to => 'users#index'

  resources :users, only: [:index, :show] do   
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :destroy] # posts/post_id/comments/id
    end
  end

  put 'user/:user_id/post/:id/like', to: 'posts#like', as: 'like' 
end
