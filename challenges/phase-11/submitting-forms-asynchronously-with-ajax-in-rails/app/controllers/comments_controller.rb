class CommentsController < ApplicationController
  def create
    @video = Video.find(params[:video_id])
    @comment = @video.comments.build(comment_params)
    if @comment.save
      redirect_to @video, notice: "Thank you for your input!"
    else
      flash[:error] = "There was an issue with your comment."
      render "videos/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :content)
  end
end
