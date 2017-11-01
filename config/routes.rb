Rails.application.routes.draw do

  devise_for :users
  root to: "groups#index"

  resources :groups, :users do
    resources :messages do
      collection do
        get 'chat'
      end
    end
  end


  resources :buildings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
