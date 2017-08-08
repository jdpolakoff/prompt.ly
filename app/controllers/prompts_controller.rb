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
    @prompt = Prompt.create(prompt_params.merge(user: current_user))
    redirect_to prompts_path
  end

  def edit
    @prompt = Prompt.find(params[:id])
    if @prompt.user != current_user
      flash[:alert] = "You must be the author of this prompt to edit!"
      redirect_to prompt_path(@prompt)
    end
  end

  def update
    @prompt = Prompt.find(params[:id])
    if @prompt.user === current_user
      @prompt.update(prompt_params)
    else
      flash[:alert] = "Only the author of this prompt can update or delete!"
      redirect_to prompt_path(@prompt)
    end
    redirect_to @prompt
  end

  def destroy
    @prompt = Prompt.find(params[:id])
    if @prompt.user === current.user
      @prompt.destroy
    else
      flash[:alert] = "Only the author of this post can delete!"
      redirect_to prompt_path(@prompt)
    end
    redirect_to prompts_path
  end

  private
  def prompt_params
    params.require(:prompt).permit(:title, :prompt, :img_url)
  end

end
