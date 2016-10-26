class Admin::StationsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    flash[:error] = "Station deleted from site"
    redirect_to root_path
  end
end
