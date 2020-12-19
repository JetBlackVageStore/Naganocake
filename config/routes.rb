Rails.application.routes.draw do
<<<<<<< HEAD
  
  devise_for :customers, controller: {
=======
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations',
    passwords: 'admins/passwords'
  }

  devise_for :customers, controllers: {
>>>>>>> c1493b1720828b5e4ad87dcf638f565e1548a821
    registrations: 'customers/registrations',
    sessions: 'customers/sessions',
    passwords: 'customers/passwords'
  }
<<<<<<< HEAD

  devise_for :admins, controller: {
    registrations: 'admin/registrations',
    sessions: 'admin/sessions',
    passwords: 'admin/passwords'
  }

=======
>>>>>>> c1493b1720828b5e4ad87dcf638f565e1548a821

  scope module: :customer do
    root to: 'homes#top'
    get 'homes/about'
    resources :add_deliveries, only: %i[index create destroy edit update] do
    end
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
        post '/completion' => 'orders#completion'
        get '/about' => 'orders#about'
      end
    end
<<<<<<< HEAD
    
  end
=======

>>>>>>> c1493b1720828b5e4ad87dcf638f565e1548a821

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
