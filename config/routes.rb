Rails.application.routes.draw do
  devise_for :users

  resources :clients, controller: 'users', type: 'Client'
end
