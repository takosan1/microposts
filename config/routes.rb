Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :users , except: [:show, :new]
  get 'signup'   , to: 'users#new'
  get 'login'    , to: 'sessions#new'
  post 'login'   , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'area' , to: 'users#edit'
  # get 'followers/:id' ,to: 'users#followers', as: 'followers'
  # get 'followings/:id' ,to: 'users#followings', as: 'followings'  
  
  
  resources :users, except: [:index, :new] do # 'users/≠≠≠'
    member do
      get 'followers' # '/users/:id/followers'
      get 'followings'# '/users/:id/followings'
    end
  #   collection do # 'users/~~~~~~'
  #     get 'followers'  # '/users/followers'
  #   end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
end
