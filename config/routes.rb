Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, except: [:new, :edit, :index]
  root to: "articles#index"

  resources :articles, except: [:edit, :update] do
  	resources :versions, except: [:edit, :update]
  end
end
