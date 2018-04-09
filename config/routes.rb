Rails.application.routes.draw do
  resources :eventosbahais
  get 'sessions/new'

  get 'users/new'

  get 'temas/contribuindo', :to => 'themes#contributing', :as => :themes_contributing

  get 'temas/duploproposito', :to => 'themes#twofold', :as => :themes_twofold

  get 'temas/iniciodaadolescencia', :to => 'themes#early_adolescence', :as => :themes_early_adolescence

  get 'themes/selfless'

  get 'temas/amizade', :to => 'themes#friendship', :as => :themes_friendship

  get 'themes/coherence'

  get 'temas/construcaodecomunidades', :to => 'themes#youth', :as => :themes_youth

  get 'themes/qualities'

  get 'temas/construcaodecomunidades', :to => 'themes#building', :as => :themes_building

  #Login
  resources :users
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'

  #Cadastro Conferências
  
  get '/conf/:id' => 'bemvindos#show', :as => :bemvindo
  get 'bemvindos' => 'bemvindos#index'
  post 'bemvindos' => 'bemvindos#create'
  delete 'conf/:id' => 'bemvindos#destroy', :as => :del_insc
  get 'conferencias/inscricao', :to => 'bemvindos#new', :as => :new_bemvindo


  default_url_options :host => "jambo.ninja"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/page/:page" => "pages#show"
  get 'sobre', :to => 'pages#about', :as => 'my_about'
   get 'local', :to => 'pages#local', :as => 'my_local'

 

  get ':permalink', :controller => 'pages', :action => 'themes', :as => 'my_themes'
  #get '/bemvindos' => "bemvindos#index"
  get "/form" => "pages#form"
  root "bemvindos#new"



end
