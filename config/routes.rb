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

  match '*path', via: [:options], to:  lambda {|_| [204, {'Content-Type' => 'text/plain'}, []]}
end

