Rails.application.routes.draw do

  root to: 'welcome#index'

  resources :prompts do
    resources :posts
    end

    resources :posts do
      resources :comments
    end

end
