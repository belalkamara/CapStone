Rails.application.routes.draw do
  devise_for :users
  resources :activities, except: [:show] 
  get 'draft-events', to: 'activities#draft'
  get 'activity/:id', to: 'activities#show', as: "activity_show"

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs, :activities do
    member do
      get :toggle_status
    end
  end
  
  root to: 'pages#home'
end
