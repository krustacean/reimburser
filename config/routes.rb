Rails.application.routes.draw do


  devise_for :users, :controllers=>{:omniauth_callbacks=>"users/omniauth_callbacks"}

  root to: "welcome#index"

  resources :users, :transactions

  get "/transactions/search/:search", to: "transactions#search", as:"search"
end