Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "genres#index"
  resources :users, only: [:index, :show]
  resources :genres
  resources :categories do
    resources :talks
  end
end