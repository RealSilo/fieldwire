Rails.application.routes.draw do
  mount ImageUploader::UploadEndpoint => "/images/upload"
  devise_for :users

  root to: 'users#index'

  resources :users, only: [:show] do
    resources :projects
  end

  resources :projects, only: [] do
    resources :floorplans
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
