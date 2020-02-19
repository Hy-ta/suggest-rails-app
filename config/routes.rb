Rails.application.routes.draw do

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
  end
  
  root to: 'pages#index'

  get 'pages/index'
  get 'users/gallery'
  resources :users
    resources :posts do
      resources :comments, only: [:create, :delete, :new]
    end

end
