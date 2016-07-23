Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: 'sessions',
                            registrations: 'registrations'}
  resources :users, except: [:new, :edit]

  resources :homes, except: [:new, :edit] do
    resources :chores, except: [:new, :edit] do
      member do
        put "like", to: "chores#upvote"
        put "dislike", to: "chores#downvote"
        get "votecount", to: "chores#votecount"
        post 'completed'
      end
    end
    resources :bills, except: [:new, :edit] do
      post 'completed'
    end
    resources :lists, except: [:new, :edit] do
      post 'completed'
    end
  end
  # devise_scope :user do
  # root :to => 'devise/sessions#new'
# end
end
