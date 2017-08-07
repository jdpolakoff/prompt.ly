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
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
