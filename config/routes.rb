Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :services
  resources :patients
  resources :materials
  resources :service_materials  
  resources :everyday_lists, as: 'everyday_lists'
  resources :orders do
    resources :service_orders
  end
  root to: 'patients#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
