Rails.application.routes.draw do
 scope module: :public do
  root to: 'homes#top'
  get "/homes/about" => "homes#about", as: "about"
  get "/customers" => "customers#show", as: "show"
  get "/customers/introduction/edit" => "customers#edit", as: "edit"
  get "/customers/withdraw" => "customers#withdraw", as: "withdraw"
  patch "/customers/leave" => "customers#leave"
  patch "/customers" => "customers#update", as: "update"
  delete "/cart_items/all_destroy" => "cart_items#all_destroy", as: "all_destroy"
  get "/orders/complete" => "orders#complete", as: "complete"
  post "/orders/confirm" => "orders#confirm", as: "confirm"
  resources :items, only: [:show, :index]
  resources :orders, only: [:show, :edit, :new, :index ]
  resources :cart_items, only: [:create, :index, :update, :destroy]
 end
  namespace :admin do
  get "/admin/orders/:id" => "admin/orders#orders", as: "orders"
  resources :items, only: [:new, :create, :index, :show, :edit, :update]
  resources :customers, only: [:show, :edit, :update, :index]

  end


devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}



end
