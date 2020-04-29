Rails.application.routes.draw do
  root to: 'rankings#index'

  resources :item, only: [:new, :create, :edit, :update, :destroy] 
  
  resources :rankings  
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:create, :edit, :update, :show]
end
