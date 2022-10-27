Rails.application.routes.draw do

  namespace :public do
    get '/' => 'homes#top'
    get "/home/about" => "homes#about", as: "about"
    resources :orders, only: [:new, :index, :create, :edit, :update, :destroy, :complete, :show, :confirm]
    post '/public/confirm'

    resources :items, only: [:index, :create, :show, :update, :destroy]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    patch ':id/cart_item/:name' => 'customers#cart_item', as: 'cart_item_user'

    delete 'cart_items/:id' =>'cart_items#destroy', as: 'destroy_cart_item'


    resource :customer, only: [:create, :edit, :show, :update, :destroy]
    get 'unsubscribe/:name' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch ':id/withdraw/:name' => 'customers#withdraw', as: 'withdraw_user'
    put 'withdraw/:name' => 'customer#withdraw'

    resources :addresses, only: [:new, :create, :edit, :index, :update, :destroy]
    delete 'addresses/:id' =>'addresses#destroy', as: 'destroy_address'

  end


  namespace :admin do
    get "/home/about" => "homes#about", as: "about"
    get 'top' => 'homes#top'
    resources :homes, only: [:new, :index, :create, :edit, :update, :destroy]
    resources :genres, only: [:new, :index, :create, :edit, :update, :destroy]
    get 'genres/index'
    get 'genres/edit/:id' => 'genres#edit'
    resources :items, only: [:new, :index, :create, :edit, :show, :update, :destroy]
    get 'items/index'
    get 'lists/:id' => 'lists#show'
    resources :orders, only: [:show]
    resources :customers, only: [:new, :index, :show, :create, :edit, :update, :destroy]




  end


# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

resources :admin, only: [:new]
end
