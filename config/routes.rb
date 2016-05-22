Rails.application.routes.draw do
  devise_for :users

  resources :clients, controller: 'users', type: 'Client'
  resources :admins, controller: 'users', type: 'Admin'
  resources :custom_form_fields
  resources :contacts


  root to: 'dashboard#new'
end
