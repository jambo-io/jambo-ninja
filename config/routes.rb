Rails.application.routes.draw do
  resources :bemvindos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/page/:page" => "pages#show"
  get "/form" => "pages#form"
  root "pages#index", page: "index"

end
