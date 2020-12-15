Rails.application.routes.draw do
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admin do
    get 'orders_items/update'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/update'
    get 'items/edit'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/update'
    get 'customers/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/show'
    get 'genres/upadate'
    get 'genres/edit'
  end
  namespace :customer do
    get 'items/index'
    get 'items/search'
    get 'items/show'
  end
  namespace :customer do
    get 'add_deliveries/index'
    get 'add_deliveries/create'
    get 'add_deliveries/destroy'
    get 'add_deliveries/edit'
    get 'add_deliveries/update'
  end
  namespace :customer do
    get 'into_carts/update'
    get 'into_carts/index'
    get 'into_carts/destroy'
    get 'into_carts/destroy_all'
    get 'into_carts/create'
  end
  namespace :customer do
    get 'orders/new'
    get 'orders/show'
    get 'orders/create'
    get 'orders/completion'
    get 'orders/index'
    get 'orders/about'
  end
  namespace :customer do
    get 'customers/Orders'
    get 'customers/new'
    get 'customers/show'
    get 'customers/create'
    get 'customers/completion'
    get 'customers/index'
    get 'customers/about'
  end
  namespace :customer do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/upadate'
    get 'customers/unsubscribe'
    get 'customers/withdraw'
  end
  get 'homes/top'
  get 'homes/about'
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
