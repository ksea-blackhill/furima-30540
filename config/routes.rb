Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :items do
    resources :payments, only: [:index,:create]
  end
end