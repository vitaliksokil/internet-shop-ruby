Rails.application.routes.draw do
  resources :line_items
  resources :carts
  get 'store/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products

  root to: 'store#index', as: 'store'
end
