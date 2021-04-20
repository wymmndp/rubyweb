Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#index"
  #login
  get "/login", to:"session#login"
  post  "/login"    => "session#create"
  delete "/logout"   => "session#destroy"
  # register
  get "/register", to:"users#new"
  # detailgame
  get "/game/:id", to:"users#game", as:"game"
  # playgame
  get "/game/play/:id", to:"users#playgame"
  # view all categories
  get "/all-categories", to:"users#allcategories"
  # view game in category
  get "/tag/:idcategory", to:"users#gameincategory"
  # search
  get "/search", to:"users#viewsearch"
end
