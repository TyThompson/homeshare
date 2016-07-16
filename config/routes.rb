Rails.application.routes.draw do
devise_for :users

  devise_scope :user do
  root :to => 'devise/sessions#new'
end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  # resource :home, only: [:show]

  # root to: "home#show"
end
