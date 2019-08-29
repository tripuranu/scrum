Rails.application.routes.draw do

  resources :dailyforms, only: %i[show create update]

  authenticated :user do
    root :to => "dailyforms#show", :id => Date.today.to_s, as: :authenticated_root
  end
  root to: 'home#dashboard'
  as :user do
    get '/users/sign_out' => 'devise/sessions#destroy', :via => :patch, :as => :destroy_user_session_path  
  end

  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks" }

  root 'home#welcome'
end
