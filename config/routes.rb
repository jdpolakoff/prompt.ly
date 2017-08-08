Rails.application.routes.draw do

  devise_for :users
  root to: 'welcome#index'

  resources :prompts do
    resources :posts
    end

    resources :posts do
      resources :comments
    end

end
