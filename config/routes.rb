Rails.application.routes.draw do




devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
 scope module: :public do
  root to: 'homes#top'
  get "/homes/about" => "homes#about", as: "about"
  resources :items, only: [:show, :index]
  resources :customers, only: [:show, :edit, :withdraw, :leave]
  resources :orders, only: [:show, :edit, :new, :index, :confirm, :complete]
  resources :cart_items, only: [:create, :index, :update, :destroy, :all_destroy]
 end
 
  namespace :admin do

  resources :items, only: [:new, :create, :index, :show, :edit, :update]
  resources :customers, only: [:show, :edit, :update, :index]
  resources :orders, only: [:orders]
  end
end
