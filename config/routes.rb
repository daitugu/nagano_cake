Rails.application.routes.draw do



devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
 scope module: :public do
   root to: "homes#top"
  get "/homes/about" => "homes#about", as: "about"
 resources :items


 end
  namespace :admin do

  resources :items
  end
end
