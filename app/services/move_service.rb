# handles moving one pawn and figures out if that move is allowed
class MoveService
  attr_reader :error

  def initialize(game, pawn, to_row, to_column)
    @game = game
    @pawn = pawn
    @to_row = to_row
    @to_column = to_column
    @error = nil
  end

  # returns true if the move worked, false if it didn't (check .error for why)
  def call
    if @game.state != "in_progress"
      @error = "Game is not in progress"
      return false
    end

    if @pawn.team != @game.current_turn
      @error = "It is not #{@pawn.team}'s turn"
      return false
    end

    if @to_row < 0 || @to_row > 7 || @to_column < 0 || @to_column > 7
      @error = "Target cell is out of bounds"
      return false
    end

    if @pawn.team == "team1"
      direction = 1
    else
      direction = -1
    end

    # look for a pawn already sitting on the target cell
    target_pawn = nil
    @game.pawns.each do |other_pawn|
      if other_pawn.row == @to_row && other_pawn.column == @to_column
        target_pawn = other_pawn
      end
    end

    moved = false

    # straight move, one cell forward, cell has to be empty
    if @to_row == @pawn.row + direction && @to_column == @pawn.column && target_pawn.nil?
      @pawn.update!(row: @to_row, column: @to_column)
      moved = true
    end

    # diagonal move, one cell forward, has to be landing on an enemy pawn
    if !moved && @to_row == @pawn.row + direction && (@to_column == @pawn.column + 1 || @to_column == @pawn.column - 1)
      if !target_pawn.nil? && target_pawn.team != @pawn.team
        target_pawn.destroy!
        @pawn.update!(row: @to_row, column: @to_column)
        moved = true
      end
    end

    if !moved
      @error = "Illegal move"
      return false
    end

    check_for_winner
    @game.advance_turn!

    true
  end

  private

  def check_for_winner
    if @pawn.team == "team1" && @pawn.row == 7
      @game.complete!("team1")
      return
    end

    if @pawn.team == "team2" && @pawn.row == 0
      @game.complete!("team2")
      return
    end

    if @pawn.team == "team1"
      other_team = "team2"
    else
      other_team = "team1"
    end

    pawns_left = @game.pawns.where(team: other_team).count
    if pawns_left == 0
      @game.complete!(@pawn.team)
    end
  end
end
