class PromptsController < ApplicationController

  def index
    @prompts = Prompt.all
  end

  def show
    @prompt = Prompt.find(params[:id])
    @random_prompt = Prompt.all.sample
  end

  def new
    @prompt = Prompt.new
  end

  def create
    @prompt = Prompt.create(prompt_params)
    redirect_to prompts_path
  end


  private
  def prompt_params
    params.require(:prompt).permit(:title, :prompt, :img_url)
  end

end
