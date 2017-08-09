class WelcomeController < ApplicationController

  def index
    @prompt = Prompt.all.sample
    @random_prompt = Prompt.all.sample
  end

  def show
    render template: '/welcome/about'
  end

end
