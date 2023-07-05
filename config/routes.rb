Rails.application.routes.draw do
 scope module: :public do
   root to: "homes#top"
  get "/homes/about" => "homes#about", as: "about"
 resources :items
 

 end
  namespace :admin do
      
  resources :items
  end
end
