Rails.application.routes.draw do
  post '/orders/confirm'
  get 'orders/complete'=>'orders#complete'
  resources :orders
  resources :cart_items
  resources :items
  resources :adresses

  devise_for :customers,skip:[:passwords],
  controllers:{registrations: "public/registrations",
    sessions: 'public/sessions'}
  get '/customers/my_page'=>'customers#show'
  get '/customers/unsubscribe'=>'customers#unsubscribe'
  patch '/customers/withdraw'=>'customers#withdraw'
  resources :customers

  root to: 'homes#top'
  get 'homes/about'=>'homes#about'
  get 'homes/thank'=>'homes#thank'

  namespace :admin do
    get 'homes/top'=>'homes#top'
    resources :items
    resources :shops
    resources :customs
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
