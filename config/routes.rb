Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
  root "home#top"
  resources :categories, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
  end
end
