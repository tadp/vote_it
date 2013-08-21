PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
    # resources :posts, except: :destroy do
  resources :posts do
  	resources :comments, only: :create
  end

end
