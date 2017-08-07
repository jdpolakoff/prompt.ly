class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comment.create(comment_params)
    redirect_to prompt_post_comments
  end


  private
    def comment_params
      params.require(:comment).permit(:comment)
    end


end
