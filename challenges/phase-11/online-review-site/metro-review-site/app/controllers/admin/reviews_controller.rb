class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:alert] = "Review deleted."
    redirect_to station_path(params[:station_id])
  end

end
