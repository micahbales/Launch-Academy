class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post

    if @comment.save
      flash[:notice] = "Comment added to post!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Comment must include at least 50 characters"
      render :'posts/show'
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:description, :post_id)
  end
end
