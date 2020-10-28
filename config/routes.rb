Rails.application.routes.draw do

  get 'notifications/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #root to: 'phrases#index', as: :root_path
  devise_for :users, :controllers => { registrations: 'user/registrations' }
  root to: 'phrases#index', as: :root
  #resources :phrases, only: [:index, :new, :create, :edit, :show]
  #delete '/phrases', to: 'phrase#destroy', as: 'destroy_phrase'
  resources :phrases do
    member do
      post 'vote'
    end
    resources :examples do
      post :vote
    end
  end
  # Adding routes to notifications
  resources :notifications, only: :index do
    collection do
      put :read_all
    end
  end
  ################################
  resources :users, only: [:show, :index]
  get 'static_pages/hello'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
