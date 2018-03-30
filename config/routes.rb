Rails.application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  root to: "groups#index"

  resources :groups do
    resources :messages do
      resources :comments
    end
  end

  resources :rooms do
    resources :chats
  end

  resources :timelines do
    resources :reviews
  end

  resources :users
  resources :buildings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
