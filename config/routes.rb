Rails.application.routes.draw do
  devise_for :users
  get 'categories/index'
  get 'categories/show'
  root "home#top"
  resources :categories, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
  end
end
