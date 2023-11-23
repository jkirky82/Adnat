Rails.application.routes.draw do
  root 'organisations#index'
  
  
  get 'join_organisation/:id' => 'organisations#join',  :as => "join_organisation"
  get 'overview' => 'organisations#overview', :as => "overview"
  put 'leave/:id' => 'organisations#leave', :as => "leave_organisation"
  get 'logout' => 'sessions#destroy'
  

  resources :users
  resources :sessions
  resources :organisations
end
