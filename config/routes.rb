Rails.application.routes.draw do
devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" } #{}"users/omniauth_callbacks" }



#   devise_scope :user do
#   root :to => 'devise/sessions#new'
# end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/users/sign_in')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resources :home#, only: [:show]

  root to: "home#show"
end
