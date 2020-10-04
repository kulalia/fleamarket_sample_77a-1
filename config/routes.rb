Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }
  root 'items#index'
  resources :items, only:[:index, :new, :create, :show]
  resources :users, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index]
  resources :cards, only: [:index, :new, :create, :destroy] do
    member do
      get 'buy_confirm'
      get 'purchase'
    end
  end
end
