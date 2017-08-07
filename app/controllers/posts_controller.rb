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
    @post = @prompt.posts.create(post_params)
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
  end

  def update
    @prompt = Prompt.find(params[:prompt_id])
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to prompt_post_path(@prompt)
  end

  def destroy
    @prompt = Prompt.find(params[:prompt_id])
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to prompt_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
