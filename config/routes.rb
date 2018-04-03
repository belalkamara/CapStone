Rails.application.routes.draw do
  resources :activities, except: [:show]
  get 'activity/:id', to: 'activities#show', as: "activity_show"

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs
  
  root to: 'pages#home'
end
