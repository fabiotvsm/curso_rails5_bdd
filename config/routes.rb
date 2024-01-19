Rails.application.routes.draw do
  # get 'users/:id' , to: 'users#main', as: 'user'
  resources :users, except: %i[show new create destroy]
  devise_for :users
  # get 'articles/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "articles#index"
  resources :articles
end
