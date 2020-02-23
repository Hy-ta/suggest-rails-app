Rails.application.routes.draw do

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
   devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
    }

  devise_scope :user do
    get "users/show", :to => "users/user_id#show"
    get "user/id", :to => "users/registration#detail"
    get "signup", :to => "users/registrations#new"
    get "sign_in", :to => "devise/sessions#new"
    get "login", :to => "users/sessions#new"
    # get 'users/:id/edit' => 'users/registrations#edit', as: :edit_other_user_registration
    # match 'users/:id', to: 'users/registrations#update', via: [:patch, :put], as: :edit_other_user_registration
  end
  
  root to: 'pages#index'

  get 'pages/index'
  get 'users/gallery'
  get 'users/chat'
  resources :users
  # resources :csv_import, only: :index
    resources :posts do
      resources :comments, only: [:create, :delete, :new]
    end

    mount ActionCable.server => '/cable'
    resources :rooms, only: [:show, :create, :delete, :new] 
    resources :messages, only: [:create, :delete, :new]


end
