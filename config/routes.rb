Rails.application.routes.draw do
  resources :words
  devise_for :users
  root :to => 'static_pages#home'
end
