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
  resources :activities, except: [:show] do
    put :sort, on: :collection
  end
  get 'draft-events', to: 'activities#draft'
  get 'activity/:id', to: 'activities#show', as: "activity_show"
  get 'user-dashboard', to: 'user_dashboard#index'
  post "user-dashboard"            => "user_dashboard#update"
  get 'user-profile', to: 'user_dashboard#profile'
  get 'user-activities', to: 'user_dashboard#active_activities'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'ranking', to: 'pages#ranking'
  get 'tweets', to: 'pages#tweets'

  resources :blogs, :activities do
    member do
      get :toggle_status
    end
  end
  
  mount ActionCable.server => '/cable'

  root to: 'pages#home'
end
