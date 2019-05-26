Rails.application.routes.draw do

  resources :participant_roles
  
  devise_for :users do
    resources :user_profiles
  end
  resources :media
  resources :contacts
  resources :jambodoc_categories
  resources :phones
  resources :news
  resources :blogs
  resources :qualquernomes
  #M Mapa Agrupamentos - Jambomapa
  get 'jambomapa' => 'jambomaps#index'

  # Documentos Baháiś - - Jambodocs
  resources :jambodocs



  # Eventos Bahá'ís
  get 'eventosbahais/email' => 'eventosbahais#sendemail'
  get 'eventosbahais/atemail' => 'eventosbahais#updateemail'
  get 'participantes/conf' => 'participants#confirmation', :as => :confirm
  post 'participantsev' => 'participants#eventosbahais', :as => :partsev
  resources :eventosbahais
  resources :participants
  resources :drives

  get '/initialize' => 'drives#initialize'


  patch '/ruhibooks' => 'ruhibooks#update'
  patch '/clusters' => 'clusters#update'

  get 'pin/' => 'pins#new'
  post 'pin/' => 'pins#create'
  delete 'sair' => 'pins#destroy'
  post 'pay' => 'pins#pay', as: :pay
  get 'badges' => 'badges#index'
  get 'listas' => 'presencelists#index'
  get 'teste' => 'pages#test'

  get 'ev/n/:id' => 'participants#new', :as => 'partnew'

  get 'sessions/n'

  get 'usuario/n'

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
  get 'login' => 'sessions#new'
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
  root "eventosbahais#index"



end
