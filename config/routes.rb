Rails.application.routes.draw do

  resources :transactions, only: [:index, :create, :new]

  root to: 'transactions#index'
end