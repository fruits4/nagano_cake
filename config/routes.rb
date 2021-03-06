Rails.application.routes.draw do

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations',
    passwords: 'customers/passwords'}

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }


  get 'about' => 'homes#about'



  namespace :admin do
  	resources :products
    resources :customers, only: [:index, :show, :update, :edit]
    resources :genres, only: [:index, :create, :update, :edit] do
      patch '/:id/edit' => 'genres#update'
    end
    get 'serch' => 'search#search'
    get 'top' => 'top#top'
    resources :orders, only: [:index, :show, :update]
    resources :orderd_products, only: [:update]
  end

  namespace :public do
    get '/' => 'products#top'
  	resources :shippings, only: [:index, :edit, :destroy, :create, :update]
  	resources :products, only: [:index, :show]
  	resources :orders, only: [:new, :index, :create, :show] do
      collection do
        post 'confirm' => 'orders#confirm'
        get 'complete' => 'orders#complete'
      end
    end

  	resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all' => 'cart_items#destroy_all'
      end
    end
    resource :customers, only: [:edit, :update] do
      collection do
        get 'my_page' => 'customers#my_page'
        get 'confirm' => 'customers#confirm'
        patch '/withdraw' => 'customers#withdraw'
      end
    end
  end




    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
