Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#welcome'
  get 'auth/google_oauth2/callback', to: 'sessions#create_google'
  get 'guests/signin', to: 'guests#signin'
  get 'venues/most_popular', to: 'venues#most_popular'

  resources :hosts, only: [:new, :create, :edit, :update]
  resources :sessions, only: [:new, :create]
  resources :venues, only: [:index, :show]
  resources :events, only: [:show, :update]

  get '/signout', to: 'sessions#destroy'

   resources :hosts do
     resources :events
     resources :venues, only: [:show]
   end
end

# GoogleAuthExample::Application.routes.draw do
#
#   get 'auth/failure', to: redirect('/')
#   get 'signout', to: 'sessions#destroy', as: 'signout'
#
#   resources :sessions, only: [:create, :destroy]
#   resource :home, only: [:show]
#
#   root to: "home#show"
# end
