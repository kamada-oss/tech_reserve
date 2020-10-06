Rails.application.routes.draw do
  resources :events
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'categories/index'
  get 'categories/show'
  root "home#top"
  resources :categories, only: %i[index show] 
  resources :comments, only: %i[create destroy]

  resources :mypage, only: [] do
    member do
      get 'comment_index'
      get 'edit_profile'
      post 'update_profile'
    end
  end
end
