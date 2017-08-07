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

  def edit
    @prompt = Prompt.find(params[:id])
  end

  def update
    @prompt = Prompt.find(params[:id])
    @prompt.update(prompt_params)
    redirect_to @prompt
  end

  def destroy
    @prompt = Prompt.find(params[:id])
    @prompt.destroy
    redirect_to prompts_path
  end 

  private
  def prompt_params
    params.require(:prompt).permit(:title, :prompt, :img_url)
  end

end
