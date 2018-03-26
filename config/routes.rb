Rails.application.routes.draw do

  resources :contacts
  resources :feeds
  
  resources :instas do
     collection do
      post :confirm
    end
  end
  
  root to: 'instas#index'
  root to: 'instas#edit'
  root to: 'instas#new'
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end

