class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @prompt = @post.prompt
    @comment = @post.comments.create(comment_params)
    redirect_to prompt_post_path(@prompt, @post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @prompt = @post.prompt
    @comment = @post.comments.find(params[:id]).update(comment_params)
    redirect_to prompt_post_path(@prompt, @post)
  end



  private
    def comment_params
      params.require(:comment).permit(:comment)
    end


end
