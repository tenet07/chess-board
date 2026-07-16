class Game < ApplicationRecord
  has_many :pawns, dependent: :destroy

  enum :state, { in_progress: 0, completed: 1 }
  enum :current_turn, { team1: 0, team2: 1 }

  after_create :seed_pawns

  def advance_turn!
    if state == "completed"
      return
    end

    if current_turn == "team1"
      update!(current_turn: "team2")
    else
      update!(current_turn: "team1")
    end
  end

  def complete!(winning_team)
    update!(state: "completed", final_state: winning_team)
  end

  def as_board_json
    pawns_data = []

    pawns.each do |pawn|
      pawns_data << {
        "id" => pawn.id,
        "row" => pawn.row,
        "column" => pawn.column,
        "team" => pawn.team
      }
    end

    {
      "id" => id,
      "state" => state,
      "current_turn" => current_turn,
      "final_state" => final_state,
      "pawns" => pawns_data
    }
  end

  private

  def seed_pawns
    8.times do |column|
      Pawn.create!(game: self, row: 0, column: column, team: "team1")
      Pawn.create!(game: self, row: 7, column: column, team: "team2")
    end
  end
end
