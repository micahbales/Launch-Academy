class VotesController < ApplicationController
  before_action :authenticate_user!

  def create

    @review = Review.find(vote_params[:review_id])
    @station = @review.station
    @vote = Vote.find_by(user_id: current_user.id, review_id: @review.id)
    user_input = vote_params[:value].to_i

    if @vote
      if @vote.value == 0

        @vote.value = user_input
        @vote.save
        flash[:alert] = "Your vote has been updated!"
        redirect_to @station
      else
        if @vote.value == user_input

          flash[:error] = "You can only vote once!"
          redirect_to @station
        else
          @vote.value = 0
          @vote.save

          flash[:alert] = "Your vote has been updated!"
          redirect_to @station
        end
      end
    else
      @vote = Vote.create(vote_params)

      flash[:alert] = "Thanks for your vote!"
      redirect_to @station
    end
  end

  private

  def vote
    @vote ||= Vote.find_by(user_id: vote[:user_id], review_id: vote[:review_id])
  end

  def vote_params
    params.require(:vote).permit(:user_id, :review_id, :value)
  end
end
