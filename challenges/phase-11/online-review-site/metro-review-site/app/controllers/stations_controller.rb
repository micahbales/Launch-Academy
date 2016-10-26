class StationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    redirect_to root_path
  end

  def new
    @station = Station.new
  end

  def create

    @station = Station.new(station_params)

    if @station.save
      flash[:error] = "Your station has been successfully added!"
      redirect_to @station
    else
      flash[:error] = "Your station could not be created. Please provide all required information."
      render :new
    end
  end

  def show
    @station = Station.find(params[:id])
    @review = Review.new
    @reviews = @station.reviews
    @vote = Vote.new
  end

  def edit
    @station = Station.find(params[:id])
  end

  def update
    @station = Station.find(params[:id])

    if @station.update(station_params)
      flash[:error] = "Your station has been successfully updated!"
      redirect_to @station
    else
      flash[:error] = "Your station could not be updated. Please provide all required information."
      render :edit
    end
  end

  private

  def station_params
    params.require(:station).permit(:name, :line, :state, :description, :parking)
  end
end
