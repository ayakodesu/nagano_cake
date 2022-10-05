Rails.application.routes.draw do

  namespace :admin do
    get "/home/about" => "homes#about", as: "about"
    resources :genres, only: [:new, :index, :create, :edit, :update, :destroy]
    get 'items/new'
    get 'items/edit'
  end

  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'top' => 'homes#top'
    get 'genres/index'
    get 'genres/edit/:id' => 'genres#edit'

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
