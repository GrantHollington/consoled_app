Rails.application.routes.draw do
  #create post route for stripe payment
  post 'payment/page', to: "payment#create", as: 'payment'
  #route to cancel payment
  get 'payment/cancel', to: "payment#cancel", as: 'payment_cancel'
  resources :images
  resources :reviews
  resources :listings
  resources :sellers
  resources :buyers
  resources :profiles
  devise_for :users
  root 'home#page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
