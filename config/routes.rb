Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users

  resources :users_admin, :controller => 'users', only: [:index, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, except: [:new, :edit, :index]

  resources :categorizations, only: [:create, :destroy]

  get '/articles/search', to: 'articles#search', as: :articles_search

  get '/unauthorized', to: 'application#unauthorized', as: :unauthorized

  root to: "articles#index"

  resources :articles, except: [:edit, :update] do
  	resources :versions, except: [:edit, :update]
  end
end
