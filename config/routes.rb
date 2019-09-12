Rails.application.routes.draw do

  resources :dailyforms, only: %i[edit show create update] do
    resources :comments
  end

  resources :notifications, only: [:index] do
    collection do
      get :mark_as_read
    end
  end

  authenticated :user do
    root :to => "dailyforms#edit", :id => Date.today.to_s, as: :authenticated_root
  end

  namespace :admin do
    resources :dailyforms do
      resources :comments
    end
    resources :users
  end
  
  root to: 'home#dashboard'
  as :user do
    get '/users/sign_out' => 'devise/sessions#destroy', :via => :patch, :as => :destroy_user_session_path  
  end

  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks" }
end