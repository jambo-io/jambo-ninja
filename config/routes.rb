Rails.application.routes.draw do
  get 'themes/contributing'

  get 'themes/twofold'

  get 'themes/early_adolescence'

  get 'themes/selfless'

  get 'themes/friendship'

  get 'themes/coherence'

  get 'themes/youth'

  get 'themes/qualities'

  get 'themes/building'

  resources :bemvindos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/page/:page" => "pages#show"
  get ':permalink', :controller => 'pages', :action => 'about', :as => 'my_about'
  get ':permalink', :controller => 'pages', :action => 'themes', :as => 'my_themes'
  #get '/bemvindos' => "bemvindos#index"
  get "/form" => "pages#form"
  root "pages#index", page: "index", :as => 'root'



end
