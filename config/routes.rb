Rails.application.routes.draw do

  get 'welcome/index'

  resources :prompts do
    resources :posts
  end



end
