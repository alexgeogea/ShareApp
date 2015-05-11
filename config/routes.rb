Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :ideas do
  	resources :comments
  end

  authenticated :user do
  	root "ideas#index", as: "authenticated_root"
  end

  root "welcome#index" 
end
