MusicApp::Application.routes.draw do

  get "signup" => "users#new", as: :signup_path
  get "login" => "sessions#new", as: :login_path
  delete "logout" => "sessions#destroy", as: :logout_path

  resources :users

  resources :sessions

  resources :tracks

  resources :comments do
    member do
      put :flag
    end
    collection do
      get :flagged
    end
    resources :comments  # :only => :create
  end
  get "/tracks/:track_id/comments/new", to: "comments#new"
  get "/comments/:comment_id/flag", to: "comments#flag"
  get "/comments/:comment_id/delete", to: "comments#destroy"

  root to: 'home#index'



end
