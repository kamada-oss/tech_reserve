Rails.application.routes.draw do
  root "home#top"
  resources :comments, only: [:index, :create, :destroy]
end
