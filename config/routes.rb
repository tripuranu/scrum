Rails.application.routes.draw do

  as :user do
    get '/users/sign_out' => 'devise/sessions#destroy', :via => :patch, :as => :destroy_user_session_path  
  end

  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks" }

  root 'home#welcome'
end
