Rails.application.routes.draw do


  devise_for :users, :controllers=>{:omniauth_callbacks=>"users/omniauth_callbacks"}

  root to: "welcome#index"

  get '/about', to: "welcome#about"

  resources :users, :transactions
end
