Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: 'sessions',
                            registrations: 'registrations'}
  resources :users, except: [:new, :edit] do
    member do
      post "make_payment", to: "payments#pay"
      get "received_payments", to: "payments#received_payments"
      get "sent_payments", to: "payments#sent_payments"
    end
  end

  resources :tokens, only: [:index, :destroy]

  post "/api/register" => "api#register"
  get  "/users/me" => "users#me"

# homes nest start
  resources :homes, except: [:new, :edit] do
    get "completed_chores", to: "chores#completed_chores"
    post "invite", to: "homes#invite"
    get "test" => "home#test"
    get "all_chores", to: "chores#all_chores" #gets all completed and incomplete chores
    resources :user_homes, except: [:new, :edit, :update]

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
    resource :list, except: [:new, :edit] do
      get "purchased_items", to: "items#purchased_items"
      # post 'completed'
      resources :items, except: [:new, :edit] do
        member do
          post "purchase"
        end
      end
    end
  end
#homes nest ends
end
