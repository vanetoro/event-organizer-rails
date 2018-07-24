Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#welcome'
  get 'auth/google_oauth2/callback', to: 'sessions#create_google'
  get 'guests/signin', to: 'guests#signin'

  resources :hosts, only: [:new, :create, :edit, :update]
  resources :sessions, only: [:new, :create]
  resources :venues, only: [:index]
  resources :events, only: [:show]

  get 'hosts/:id/signout', to: 'sessions#destroy'

   resources :hosts do
     resources :events, only: [:new, :index, :show, :destroy, :update, :create]
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
