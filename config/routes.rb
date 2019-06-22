Rails.application.routes.draw do

  #Admin
  namespace :admin do
    get '' => 'dashboards#index'
    get 'mailer_manager' => 'dashboards#new_mailer_manager'
    post 'mailer_manager' => 'dashboards#create_mailer_manager', :as => :create_mailer_manager
    resources :administrative_regions
    resources :administrative_functions
  end
  
  #Login
  devise_for :users, controllers: {registrations: "registrations"}
  resources :users
  get 'login' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'
  resources :user_profile

  # Eventos Bahá'ís
  resources :eventosbahais
  get 'eventosbahais/email' => 'eventosbahais#sendemail'
  get 'eventosbahais/atemail' => 'eventosbahais#updateemail'
  get 'participantes/conf' => 'participants#confirmation', :as => :confirm
  get 'confirm/:id' => 'participants#confirm_registration', :as => :confirm_registration
  post 'participantsev' => 'participants#eventosbahais', :as => :partsev
  post 'check_email' => 'participants#check_email'
  get 'ev/n/:id' => 'participants#new', :as => 'partnew'

  # Participants
  resources :participants do
    resources :itineraries
  end
  get 'pin/' => 'pins#new'
  post 'pin/' => 'pins#create'
  delete 'sair' => 'pins#destroy'
  post 'pay' => 'pins#pay', as: :pay
  get 'badges' => 'badges#index'
  get 'listas' => 'presencelists#index'

  # Config
  default_url_options :host => "jambo.ninja"
  root "eventosbahais#index"

end
