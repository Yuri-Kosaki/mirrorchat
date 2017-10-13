Rails.application.routes.draw do

  devise_for :users
  root to: "groups#index"

  resources :groups do
    resources :messages
  end

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
