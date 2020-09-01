Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins

  namespace :admin do
  	resources :products
  end

  resources :shippings, only: [:index, :edit, :destroy, :create, :update]

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
