Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/', :to => 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

end
