PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'
  get '/login', to:'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/votes', to: 'votes#index'

  resources :users, only:[:create]
  resources :votes, only:[:index]

    # to handle votes we want a POST to /posts/3/vote => PostsController
    # and a POST to /comments/2/vote => CommentsController
    # or with: POST /votes (with params: type, and id) => VotesController
  

  # resources :posts, except: :destroy do
  resources :posts do
    member do
      post 'vote' #/posts/:id/votes
    end
    # collection do
    #   post 'archived' # /posts/archived
    # end
  	resources :comments, only: [:create] do
      member do
        post 'vote'
      end
    end
  end

  resources :categories, only: [:new, :create]

end
