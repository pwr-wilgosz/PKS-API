Rails.application.routes.draw do
  root to: 'buses#index'

  resources :buses
end

