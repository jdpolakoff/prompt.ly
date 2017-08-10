class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @prompt = @post.prompt
    @comment = @post.comments.create(comment_params.merge(user: current_user))
    redirect_to prompt_post_path(@prompt, @post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @prompt = @post.prompt
    @comment = Comment.find(params[:id])
    if @comment.user != current_user
      flash[:alert] = "Only the author of this comment can edit or delete!"
      redirect_to prompt_post_path(@prompt, @post)
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @prompt = @post.prompt
    @comment = @post.comments.find(params[:id])
    if @comment.user === current_user
      @comment.update(comment_params)
    else
      flash[:alert] =  "Only the author of this comment can edit or delete!"
    end
    redirect_to prompt_post_path(@prompt, @post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @prompt = @post.prompt
    @comment = @post.comments.find(params[:id])
    if @comment.user === current.user
      @comment.destroy
    else
      flash[:alert] = "Only the author of this comment can delete!"
    end
    redirect_to prompt_post_path(@prompt, @post)
  end


  private
    def comment_params
      params.require(:comment).permit(:comment)
    end


end
