Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: 'sessions',
                            registrations: 'registrations'}
  resources :users, except: [:new, :edit] do
    member do
      get "received_payments", to: "payments#received_payments"
      get "sent_payments", to: "payments#sent_payments"
    end
  end

  resources :tokens, only: [:index, :destroy]

  post "/api/register" => "api#register"
  get  "/users/me" => "users#me"

# homes nest start
  resources :homes, except: [:new, :edit] do
    post "invite/:friend_email", to: "homes#invite"
    # post "join", to: "homes#join"
    resources :user_homes, except: [:new, :edit, :update]
    get "test" => "home#test"

    get "all_chores", to: "chores#all_chores" #gets all completed and incomplete chores
    get "chores", to: "chores#index" #gets chores that are incomplete
    post "chores", to: "chores#create"
    get "completed_chores", to: "chores#completed_chores"


    resources :chores, except: [:new, :edit] do
      member do
        put "like", to: "chores#upvote"
        put "dislike", to: "chores#downvote"
        get "votecount", to: "chores#votecount"
        post "mark_complete"
      end
    end

    get '/bills/paid', to: "bills#paid"
    resources :bills, except: [:new, :edit] do
      post "pay", to: "bills#pay"
      post "mark_paid", to: "bills#mark_paid"
    end

    resource :list, except: [:new, :edit] do
      get "purchased_items", to: "items#purchased_items"
      resources :items, except: [:new, :edit] do
        member do
          post "purchase"
        end
      end
    end

  end
#homes nest ends
end
