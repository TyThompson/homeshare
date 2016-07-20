Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: 'sessions',
                            registrations: 'registrations'}
  resources :users
  post '/homes/new' => 'homes#new'
  post '/homes/:home_id/chores/new' => 'chores#new'
  post '/homes/:home_id/bills/new' => 'bills#new'
  post '/homes/:home_id/lists/new' => 'lists#new'
  post '/users/new' => 'users#new'

  resources :homes do
    resources :chores do
      member do
        put "like", to: "chores#upvote"
        put "dislike", to: "chores#downvote"
        get "votecount", to: "chores#votecount"
      end
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
