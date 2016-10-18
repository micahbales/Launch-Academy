class BoardGamesController < ApplicationController
  before_action :set_board_game,
    only: [:show, :edit, :update, :destroy]

  def index
    @board_games = BoardGame.all
  end

  def show
  end

  def new
    @board_game = BoardGame.new
  end

  def edit
  end

  def create
    @board_game = BoardGame.new(board_game_params)
    if @board_game.save
      redirect_to board_games_path,
        notice: 'Board game was successfully created.'
    else
      render :new
    end
  end

  def update
    if @board_game.update(board_game_params)
      redirect_to @board_game,
        notice: 'Board game was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @board_game.destroy
    redirect_to board_games_url,
      notice: 'Board game was successfully destroyed.'
  end

  private
    def set_board_game
      @board_game = BoardGame.find(params[:id])
    end

    def board_game_params
      params.require(:board_game).
        permit(
          :name,
          :publisher,
          :description,
          :release_date,
          :min_players,
          :max_players
        )
    end
end
