class Api::V1::ApiController < ApplicationController
  protect_from_forgery with: :null_session

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
