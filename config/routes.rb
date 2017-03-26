Rails.application.routes.draw do
  devise_for :users
  resources :movies do
    resources :reviews 
  end

  get "about/index"
  root 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
