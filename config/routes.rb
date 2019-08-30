Rails.application.routes.draw do

  resources :dailyforms, only: %i[edit show create update]

  authenticated :user do
    root :to => "dailyforms#edit", :id => Date.today.to_s, as: :authenticated_root
  end

  namespace :admin do
    resources :dailyforms
    root to: "dailyforms#welcome" 
  end
  
  root to: 'home#dashboard'
  as :user do
    get '/users/sign_out' => 'devise/sessions#destroy', :via => :patch, :as => :destroy_user_session_path  
  end

  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks" }
end