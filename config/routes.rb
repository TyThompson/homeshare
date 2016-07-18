Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :homes do
    resources :chores do
      post 'thumbs_up'
    end
    resources :bills
    resources :lists
  end
  # devise_scope :user do
  # root :to => 'devise/sessions#new'
# end

end
