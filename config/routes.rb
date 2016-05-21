Rails.application.routes.draw do
  devise_for :users

  resources :clients, controller: 'users', type: 'Client'
  resources :custom_form_fields


  root to: 'dashboard#new'
end
