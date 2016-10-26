class Api::V1::VotesController < ApplicationController
  protect_from_forgery with: :null_session

  def create

    @review = Review.find(vote_params[:review_id])
    @station = @review.station
    @vote = Vote.find_by(user_id: current_user.id, review_id: @review.id)
    user_input = vote_params[:value].to_i

    if @vote
      if @vote.value == 0
        @vote.value = user_input
        @vote.save
        render_json("Your vote has been updated!")
      else
        if @vote.value == user_input
          render_json("You can only vote once!")
        else
          @vote.value = 0
          @vote.save
          render_json("Your vote has been updated!")
        end
      end
    else
      @vote = Vote.create(user_id: current_user.id, review_id: vote_params[:review_id], value: vote_params[:value])
      render_json("Thanks for your vote!")
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:review_id, :value)
  end

  def render_json(message)
    render json: {
      voteTotal: @review.vote_total,
      voteMessage: message,
      reviewID: @review.id
    }, status: :created
  end
end
