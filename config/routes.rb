Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#welcome'

  get 'hosts/signin', to: 'hosts#signin'
  get 'hosts/signup', to: 'hosts#signup'
  get 'guests/signin', to:'guest#signin'
end
