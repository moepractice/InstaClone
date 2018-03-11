Rails.application.routes.draw do

  resources :blogs do
     collection do
      post :confirm
    end
  end
  root to: 'blogs#index'
  root to: 'blogs#edit'
  root to: 'blogs#new'
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]
  
end

