class PostsController < ApplicationController

  def index
    @prompt = Prompt.find(params[:prompt_id])
    @posts = @prompt.posts.all
    @count = 1
  end

  def new
    @prompt = Prompt.find(params[:prompt_id])
    @post = @prompt.posts.new
  end

  def create
    @prompt = Prompt.find(params[:prompt_id])
    @post = @prompt.posts.create(post_params.merge(user: current_user))
    redirect_to prompt_posts_path(@prompt)
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
    if @post.user === current.user
      @post.destroy
    else
      flash[:alert] = "Only the author of this post can delete!"
    end
    redirect_to prompt_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
