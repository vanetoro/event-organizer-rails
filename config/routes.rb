Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#welcome'

  # get 'guests/signin', to: 'guests#signin' 

  resources :hosts, only: [:new, :create]
  resources :sessions, only: [:new, :create]

   resources :hosts do
     resources :events, only: [:new, :index, :show, :destroy, :update, :create]
   end
end
