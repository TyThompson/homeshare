Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :homes do
    resources :chores do
      post 'thumbs_up'
    end
    resources :bills do
      post 'completed'
    end
    resources :lists do
      post 'completed'
    end
    resources :users, only: [:index]
  end
  # devise_scope :user do
  # root :to => 'devise/sessions#new'
# end

end
