Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#welcome'

  get 'hosts/signin', to: 'hosts#signin'

  get 'guests/signin', to:'guests#signin'

  resources :hosts, only: [:new, :create]
  resources :events, only: [:index]
end
