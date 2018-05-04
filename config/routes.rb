Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :activities
    resources :blogs
    resources :topics
    resources :types

    root to: "users#index"
  end

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :activities, except: [:show] 
  get 'draft-events', to: 'activities#draft'
  get 'activity/:id', to: 'activities#show', as: "activity_show"

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'ranking', to: 'pages#ranking'

  resources :blogs, :activities do
    member do
      get :toggle_status
    end
  end
  
  root to: 'pages#home'
end
