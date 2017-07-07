Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :cohorts do
    resources :lectures
  end
  resources :students

  namespace :admin do
    resources :users do
      resources :approvals, only: [:create, :destroy]
      resources :administrator, only: [:create, :destroy]
    end
  end
end
