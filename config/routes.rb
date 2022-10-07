Rails.application.routes.draw do

  namespace :admin do
    get "/home/about" => "homes#about", as: "about"
    get 'top' => 'homes#top'
    resources :genres, only: [:new, :index, :create, :edit, :update, :destroy]
    get 'genres/index'
    get 'genres/edit/:id' => 'genres#edit'

    resources :items, only: [:new, :index, :create, :edit, :show, :update, :destroy]
    get 'items/index'
    get 'lists/:id' => 'lists#show'
    resources :orders, only: [:new, :index, :create, :edit, :update, :destroy]
    resources :customers, only: [:new, :index, :create, :edit, :update, :destroy]
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
