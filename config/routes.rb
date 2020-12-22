Rails.application.routes.draw do

  get 'search/search'
  devise_for :customers, controller: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions',
    passwords: 'customers/passwords'
  }

  devise_for :admins, controller: {
    registrations: 'admin/registrations',
    sessions: 'admin/sessions',
    passwords: 'admin/passwords'
  }

  scope module: :customer do
    root to: 'homes#top'
    get '/about' => "homes#about"

    resources :add_deliveries, only: %i[index create destroy edit update] do
    end

    resources :customers do
      collection do
        get 'customers/edit' => 'customers#edit'
        patch 'customers' => 'customers#update'
        get '/my_page' => 'customers#show'
        get '/unsubscribe' => 'customers#unsubscribe'
        patch '/withdraw' => 'customers#withdraw'
      end
    end

    resources :into_carts, only: %i[index update destroy create] do
      collection do
        delete 'delete_all'
      end
    end

    resources :items, only: %i[index show] do
      collection do
        get 'search'
      end
    end

    resources :orders, only: %i[new create index show] do
      collection do
        post '/about' => 'orders#about'
        post '/completion' => 'orders#completion'
        get '/about' => 'orders#about'
        get '/completion' => 'orders#completion'
      end
    end
  end
  namespace :admin do
    resources :items, only: %i[index show new create edit update]
    resources :customers, only: %i[index show edit update]
    resources :genres, only: %i[index show create edit update]
    resources :orders, only: %i[index show update]
    resources :orders_items, only: [:update]
  end


  #https://qiita.com/hirokihello/items/fa82863ab10a3052d2ff
  #https://pikawaka.com/rails/destroy_all
  #https://railsguides.jp/routing.html
  #https://debug-life.net/entry/103
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end