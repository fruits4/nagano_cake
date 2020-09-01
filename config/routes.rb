Rails.application.routes.draw do
  get 'homes/about'
  devise_for :customers
  devise_for :admins

  get 'about' => 'homes#about'

  namespace :admin do
  	resources :products
  end

  namespace :public do
  	resources :shippings, only: [:index, :edit, :destroy, :create, :update]
  	resources :products, only: [:index]
  end

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
