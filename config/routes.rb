Rails.application.routes.draw do

  devise_for :users
  root to: 'welcome#index'

   get '/welcome/about' => 'welcome#show'

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
  # try to stay consistent with indentations

end
