Rails.application.routes.draw do
  root to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'mypage', to: 'users#show'
  get 'signup', to: 'users#new'
  resources :users, only: [:create, :edit, :update]
end
