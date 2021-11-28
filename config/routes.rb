Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    post  post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    
  end
  
  root to: 'homes#index'
  resources :trainings
  resources :articles do
    resources :comments, only: [:new, :create]

    resource :like, only: [:create, :destroy]
  end
  resources :users, only: [:show] do
    
  end
  resources :favorites, only: [:index]
  resources :accounts, only: [:show]
end
