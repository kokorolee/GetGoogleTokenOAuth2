Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :gads_auths
  resources :oauth2_tokens
  resources :oauth2_configs
  get '/', to: 'homes#index'
  root :to => "home#index"
  get "login/prompt", to: 'logins#prompt'
  get "login/callback", to: 'logins#callback'
  get "login/logout", to: 'logins#logout'
  get "login/", to: 'logins#index'

  get "login/prompt_ga", to: 'logins#prompt_ga'
  get "login/callback_ga", to: 'logins#callback_ga'
  get 'login/twitter', to: 'logins#twitter'

  get '/auth/:provider/callback', to: 'logins#twitter'
  delete '/logout', to: 'logins#twitter_destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
