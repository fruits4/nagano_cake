Rails.application.routes.draw do


  devise_for :customers
  devise_for :admins

  get 'about' => 'homes#about'

  namespace :admin do
  	resources :products

  end

  namespace :public do
  	resources :shippings, only: [:index, :edit, :destroy, :create, :update]
  	resources :products, only: [:index]
  	resources :orders, only: [:index, :new, :create, :comfirm, :complete, :show]
  	resources :cart_items, only: [:index, :create, :update, :destroy]
  end

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
