Rails.application.routes.draw do
  root to: 'rankings#index'

  resources :votes, only: [:new, :create, :edit, :update]
  
  resources :rankings do
    get :search, on: :collection
  end
  
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:create, :edit, :update, :show] do
    member do
      get :creatings
    end
  end
end
