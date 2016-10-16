class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @videos = Video.all
  end

  def show
    @comment = @video.comments.build
  end

  def new
    @genres = Genre.all
    @formats = Format.all
    @video = Video.new
  end

  def edit
  end

  def create
    @video = Video.new(video_params)

    if @video.save
      redirect_to @video, notice: 'New video created.'
    else
      render :new
    end
  end

  def update
    if @video.update(video_params)
      redirect_to @video, notice: 'Video was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_url, notice: 'Video was successfully destroyed.'
  end

  private
  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :year, :description, :genre_id, :format_id)
  end
end
