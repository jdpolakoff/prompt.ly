class PostsController < ApplicationController

  def index
    @prompt = Prompt.find(params[:prompt_id])
    @posts = @prompt.posts.all.order(:cached_votes_score => :desc)
    @count = 1
  end

  def new
    @prompt = Prompt.find(params[:prompt_id])
    @post = @prompt.posts.new
  end

  def create
    @prompt = Prompt.find(params[:prompt_id])
    if user_signed_in?
      @post = @prompt.posts.create(post_params.merge(user: current_user))
      redirect_to prompt_posts_path(@prompt)
    else
      flash[:alert] = "Please sign in to post!"
      redirect_to new_prompt_post_path(@prompt)
    end
  end

  def show
    @prompt = Prompt.find(params[:prompt_id])
    @post = Post.find(params[:id])
    @comments = @post.comments.all
    @comment = @post.comments.new
  end

  def edit
    @prompt = Prompt.find(params[:prompt_id])
    @post = Post.find(params[:id])
    if @post.user != current_user
      flash[:alert] = "Only the author of this post can edit or delete!"
      redirect_to prompt_posts_path
    end
  end

  def update
    @prompt = Prompt.find(params[:prompt_id])
    @post = Post.find(params[:id])
    if @post.user === current_user
      @post.update(post_params.merge(user: current_user))
    else
      flash[:alert] = "Only the author of this post can update!"
    end
    redirect_to prompt_post_path(@prompt)
  end

  def destroy
    @prompt = Prompt.find(params[:prompt_id])
    @post = Post.find(params[:id])
    if @post.user === current_user
      @post.destroy
    else
      flash[:alert] = "Only the author of this post can delete!"
    end
    redirect_to prompt_posts_path
  end

  def upvote
    @post = Post.find(params[:id])
    if user_signed_in?
    @post.upvote_from current_user
    redirect_back(fallback_location: root_path)
    else
    flash[:alert] = "You must be signed in to upvote."
    redirect_back(fallback_location: root_path)
  end
  end

  def downvote
    @post = Post.find(params[:id])
    if user_signed_in?
    @post.downvote_from current_user
    redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "You must be signed in to downvote."
      redirect_back(fallback_location: root_path)
    end 
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
