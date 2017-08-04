class WelcomeController < ApplicationController

  def index
    @prompt = Prompt.all.sample
  end

end
