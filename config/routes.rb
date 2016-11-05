Rails.application.routes.draw do
  resources :buses
  resources :issues

  root to: 'buses#index'
end

