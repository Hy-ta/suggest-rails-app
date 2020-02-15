Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_scope :user do
    get "users/show", :to => "users/user_id#show"
    get "user/id", :to => "users/registration#detail"
    get "signup", :to => "users/registrations#new"
    get "sign_in", :to => "devise/sessions#new"
    get "login", :to => "users/sessions#new"
  end
  
  root to: 'pages#index'
end
