Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }
  
  resources :users
  resources :bookmarks do
    member do
      post :like
      post :unlike
    end
  end
  
  get 'welcome/index'

  get 'about' => 'welcome#about'

  post :incoming, to: 'bookmarks#create'
  root to: "welcome#index"
  
end
