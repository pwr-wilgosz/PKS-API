Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :buses do
    resources :issues, on: :member, shallow: true
  end

  root to: 'buses#index'
end

