Rails.application.routes.draw do
  resources :cars
  resources :cars do
    resources :refills
  end
  get 'home/index'

  devise_for :users, controllers: {
registrations: 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
