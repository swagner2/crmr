Jumpstart::Engine.routes.draw do
  resource :admin, only: [:show]
  resource :config, only: [:create]
  resources :users, only: [:create]

  resource :docs do
    get :action_cable
    get :action_mailbox
    get :action_text
    get :active_storage
    get :admin
    get :announcements
    get :api
    get :authentication
    get :background_workers
    get :billing
    get :credentials
    get :cron
    get :databases
    get :deploying
    get :development
    get :email
    get :oauth
    get :scaffolds
    get :teams
    get :users
    get :webpacker

    get :alerts
    get :branding
    get :buttons
    get :cards
    get :forms
    get :icons
    get :javascript
    get :pagination
    get :pills
    get :typography
    get :wells
  end

  root to: "admin#show"
end
