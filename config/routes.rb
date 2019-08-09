Rails.application.routes.draw do
  get 'genre/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "genre#index"
  resources :users, only: [:index, :show]
  resources :genres do
    resources :categories
  end
end