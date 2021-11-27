Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#index'
  resources :trainings
  resources :articles do
    resources :comments, only: [:new, :create]

    resource :like, only: [:create, :destroy]
  end
  resources :users, only: [:show] do
  end
  resources :favorites, only: [:index]
end
