Rails.application.routes.draw do
  resources :words do
    collection do
      get 'search'
    end
  end
  devise_for :users
  root :to => 'static_pages#home'
end
