Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :users , except: [:show, :new]
  get 'signup'   , to: 'users#new'
  get 'login'    , to: 'sessions#new'
  post 'login'   , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'area' , to: 'users#edit'
  
  resources :users, except: [:index, :new]
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
end
