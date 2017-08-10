class PromptsController < ApplicationController

  before_action :authenticate_user!, :except => [:show, :index]


  def index
    @prompts = Prompt.all.order(:cached_votes_score => :desc)
  end

  def show
    @prompt = Prompt.find(params[:id])
    @random_prompt = Prompt.all.sample
  end

  def new
    if user_signed_in?
    @prompt = Prompt.new
    else
      flash[:alert] = "You must be signed in to create a prompt."
      redirect_to new_user_session_path
    end
  end

  def create
    if user_signed_in?
    @prompt = Prompt.create(prompt_params.merge(user: current_user))
    redirect_to prompts_path
    else
    flash[:alert] = "Please sign in to create a prompt."
    redirect_to prompts_path
  end
  end

  def edit
    @prompt = Prompt.find(params[:id])
    if @prompt.user != current_user
      flash[:alert] = "You must be signed in as the author of this prompt to edit!"
      redirect_to prompt_path(@prompt)
    end
  end

  def update
    @prompt = Prompt.find(params[:id])
    if @prompt.user === current_user
      @prompt.update(prompt_params)
    else
      flash[:alert] = "You must be signed in as the author of this prompt to make an edit or delete!"
      redirect_to prompt_path(@prompt)
    end
    redirect_to @prompt
  end

  def destroy
    @prompt = Prompt.find(params[:id])
    if @prompt.user === current.user
      @prompt.destroy
    else
      flash[:alert] = "You must be signed in as the author of this prompt to delete!"
      redirect_to prompt_path(@prompt)
    end
    redirect_to prompts_path
  end

  def upvote
    @prompt = Prompt.find(params[:id])
    if user_signed_in?
    @prompt.upvote_from current_user
    redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "You must be signed in to upvote."
      redirect_back(fallback_location: root_path)
    end
  end

  def downvote
    @prompt = Prompt.find(params[:id])
    if user_signed_in?
    @prompt.downvote_from current_user
    redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "You must be signed in to downvote."
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def prompt_params
    params.require(:prompt).permit(:title, :prompt, :img_url)
  end

end
