class Api::V1::CommentsController < Api::V1::ApiController
  def index
    if params[:video_id]
      video = Video.find(params[:video_id])
      comments = Comment.where(video: video)
    else
      comments = Comment.order(created_at: :desc).limit(10)
    end

    render json: comments
  end

  def show
    comment = Comment.find(params[:id])
    render json: comment
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: :nothing, status: :created, location: api_v1_comments_path(comment)
    else
      render json: :nothing, status: :not_found
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :content, :video_id)
  end
end
