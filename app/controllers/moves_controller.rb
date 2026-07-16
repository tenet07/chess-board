class MovesController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    pawn = game.pawns.find(params[:pawn_id])

    move = MoveService.new(game, pawn, params[:row].to_i, params[:column].to_i)
    worked = move.call

    if worked
      game.reload
      render json: game.as_board_json
    else
      render json: { error: move.error }, status: :unprocessable_entity
    end
  end
end
