Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
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

  root to: 'buses#index'
end

