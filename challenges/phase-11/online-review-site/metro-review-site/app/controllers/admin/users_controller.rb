class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
    render :index
  end

  def destroy
    @users = User.all
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { render :index }
      format.json { render json: { data: "yooooo" } }
    end
  end
end
