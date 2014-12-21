Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }
  
  resources :users
  
  get 'welcome/index'

  get 'about' => 'welcome#about'

  root to: "welcome#index"
  
end
