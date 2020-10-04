Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }
  root 'items#index'
  resources :items, only:[:index, :new, :create, :show, :edit]
  resources :users, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index] do
    member do
      get 'pay_method_select'
    end
  end
  resources :cards, only: [:new, :create, :edit, :update]
end
