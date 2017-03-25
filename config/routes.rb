Rails.application.routes.draw do
  resources :movies

  get "about/index"
  root 'about#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
