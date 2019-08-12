Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "genres#index"
  resources :users, only: [:index, :show]
  resources :genres do
    collection do
      get :display_categories
    end
  end
  resources :categories do
    resources :talks, only: :index
  end
  resources :talks, except: :index

  post '/category_users' => "category_users#create"
  delete '/category_users' => "category_users#destroy"
end