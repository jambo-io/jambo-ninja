Rails.application.routes.draw do

  #API
  namespace :api do
    namespace :v1 do
      resources :eventosbahais
    end
  end

  #Admin
  namespace :admin do
    get '' => 'dashboards#index'
    get 'test_mailer_production' => 'dashboards#test_mailer_production'
    get 'mailer_reports/mailer_participant_preview' => 'mailer_reports#mailer_participant_preview'
 
    resources :mailer_reports do
      get 'send_email' => 'mailer_reports#send_email'
    end
  end
  
  #Login
  devise_for :users, controllers: {registrations: "registrations"}
  

  resources :users
  get 'login' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'
  resources :user_profile
  resources :administrative_regions
  resources :administrative_functions

  # Eventos Bahá'ís
  resources :eventosbahais do
    resources :questions do
      get 'resp/:answer' => 'answers#create', :as => :create_answer
      get 'resp' => 'answers#show', :as => :show_answer
    end
  end
  get 'eventosbahais/email' => 'eventosbahais#sendemail'
  get 'eventosbahais/updatemail' => 'eventosbahais#updateemail'
  get 'participantes/conf' => 'participants#confirmation', :as => :confirm
  get 'confirm/:id' => 'participants#confirm_registration', :as => :confirm_registration
  post 'participantsev' => 'participants#eventosbahais', :as => :partsev
  post 'check_email' => 'participants#check_email'
  get 'ev/n/:id' => 'participants#new', :as => 'partnew'

  # Participants
  resources :participants do
    resources :itineraries, except: :index
  end
  resources :itineraries, only: :index
  
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
