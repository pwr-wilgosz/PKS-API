Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  root to: 'buses#index'
  resources :buses do
    resources :issues, on: :member, shallow: true
    resources :courses, shallow: true
  end

  resources :courses do
    resources :stops, shallow: true
    resources :buses, shallow: true
  end

  resources :stops do
    resources :courses, shallow: true
  end

  delete "/courses/:id/remove_bus/:bus_id", :to => "courses#remove_bus", :as => 'remove_course_bus'
  delete "/courses/:id/remove_stop/:stop_id", :to => "courses#remove_stop", :as => 'remove_course_stop'

  post "/courses/:id/add_bus/:bus_id", :to => "courses#add_bus", :as => 'add_course_bus'
  post "/courses/:id/add_stop/:stop_id", :to => "courses#add_stop", :as => 'add_course_stop'

  match '*path', via: [:options], to:  lambda {|_| [204, {'Content-Type' => 'text/plain'}, []]}
end

