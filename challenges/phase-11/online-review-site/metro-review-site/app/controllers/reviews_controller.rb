class ReviewsController < ApplicationController

  def show
    @station = Station.find(params[:station_id])
    @review = Review.find(params[:id])
  end

  def create
    @station = Station.find(params[:station_id])
    @review = Review.new(review_params)
    @review.station = @station

    if @review.save
      flash[:alert] = "Your comment has been successfully created!"
      redirect_to @station
    else
      flash[:error] = "Please provide both a title and a review"
      @reviews = @station.reviews
      render 'stations/show'
    end
  end

  def edit
    @review = Review.find(params[:id])
    @station = Station.find(params[:station_id])
    render :show
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      flash[:alert] = "Review successfully updated!"
      redirect_to station_review_path
    else
      flash[:alert] = "Please provide both a title and a review"
      @station = Station.find(params[:station_id])
      @review = Review.find(params[:id])
      render :show
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :content, :station_id)
  end
end
