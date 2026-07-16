class GamesController < ApplicationController
  def create
    game = Game.create!
    render json: game.as_board_json, status: :created
  end

  def show
    game = Game.find(params[:id])
    render json: game.as_board_json
  end
end
