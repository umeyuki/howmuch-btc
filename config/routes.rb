Rails.application.routes.draw do
  root 'bitcoin#index'
  resources :bitcoin, only: [:index]
  resources :xrp, only: [:index]
  resources :zaif_token, only: [:index]
end
