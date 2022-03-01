Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do
    resources :posts, only: [:show, :edit, :update, :destroy]
  end

  resources :posts, only: [:index, :show]
  
  get '/', to: 'sessions#index'
  get '/login', to: 'sessions#login'

end
