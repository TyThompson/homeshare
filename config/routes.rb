Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: 'sessions',
                            registrations: 'registrations'}
  resources :users, except: [:new, :edit]

  resources :homes, except: [:new, :edit] do
      get "completed_chores", to: "chores#completed_chores"
      get "all_chores", to: "chores#all_chores" #gets all completed and incomplete chores
  resources :chores, except: [:new, :edit] do
      member do
        put "like", to: "chores#upvote"
        put "dislike", to: "chores#downvote"
        get "votecount", to: "chores#votecount"
        post "mark_complete"
      end
    end
    resources :bills, except: [:new, :edit] do
      post 'completed'
    end
    resources :lists, except: [:new, :edit] do
      post 'completed'
      resources :items, except: [:new, :edit] do
        post "purchase_item", to: "items#purchase_item"
        get "purchased_items", to: "items#purchased"
      end
    end
  end
  # devise_scope :user do
  # root :to => 'devise/sessions#new'
# end
end
