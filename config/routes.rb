Rails.application.routes.draw do

  devise_for :users
  root to: 'welcome#index'

  resources :prompts do
    resources :posts
    end

  resources :prompts do
    member do
      put "like" => 'prompts#upvote'
      put "unlike" => 'prompts#downvote'
    end
  end

  resources :posts do
    member do
      put "like" => 'posts#upvote'
      put "unlike" => 'posts#downvote'
    end
  end
  
    resources :posts do
      resources :comments
    end

end
