Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: "users/sessions" }
  root to: "welcome#index"

  resources :users, :transactions
end
