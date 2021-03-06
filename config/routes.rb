Rails.application.routes.draw do
  resources :events
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'categories/index'
  get 'categories/show'
  root "home#top"
  get 'home/test'

  resources :categories, only: %i[index show]
  resources :comments, only: %i[create destroy edit] do
    resources :goods, only: %i[create destroy]
  end
  resources :users, only: %i[] do
    resources :relationships, only: %i[create destroy]
  end
  resources :mypage, only: [] do
    member do
      get 'comment_index'
      get 'edit_profile'
      post 'update_profile'
      get 'good_index'
      get 'comments'
      get 'follows'
    end
  end
end
