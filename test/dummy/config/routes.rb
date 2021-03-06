Dummy::Application.routes.draw do
  namespace :admin do
    match '/users' => 'users#index'
  end
  resources :users, :except => :update
  resources :registrations, :only => :update, :as => :registrations_user
  resources :comments

  match '/comments/:id/vote/:value' => 'comments#vote', :id => /\d+/, :value => /\d+/

  root :to => 'users#index'
end
