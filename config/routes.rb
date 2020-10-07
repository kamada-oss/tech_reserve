Rails.application.routes.draw do
  resources :events
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'categories/index'
  get 'categories/show'
  root "home#top"
  resources :categories, only: %i[index show]
  resources :comments, only: %i[create destroy] do
    resources :goods, only: %i[create destroy]
  end
  resources :mypage, only: [] do
    member do
      get 'comment_index'
      get 'edit_profile'
      post 'update_profile'
      get 'good_index'
      get 'comments'
    end
  end
end
