class PostsController < ApplicationController

  def new
    @prompt = Prompt.find(params[:prompt_id])
    @post = @prompt.posts.new
  end

  def create
    @prompt = Prompt.find(params[:prompt_id])
    @post = @prompt.posts.create(post_params)
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
