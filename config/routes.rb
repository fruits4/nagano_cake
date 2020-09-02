Rails.application.routes.draw do


  devise_for :customers
  devise_for :admins

  get 'about' => 'homes#about'

  namespace :admin do
  	resources :products
    resources :genres, only: [:index, :create, :update, :edit]
  end

  namespace :public do
  	resources :shippings, only: [:index, :edit, :destroy, :create, :update]
  	resources :products, only: [:index]
  	resource :orders, only: [:index, :new, :create, :complete, :show] do
      get 'confirm' => 'orders#confirm'
      get 'complete' => 'orders#complete'
    end
  	resources :cart_items, only: [:index, :create, :update, :destroy]
    resource :customers, only: [:edit, :update] do
      collection do
        get 'my_page' => 'customers#my_page'
        get '/unsubscribe' => 'customers#unsubscribe'
        patch '/withdraw' => 'customers#withdraw'
      end
    end
  end




    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
