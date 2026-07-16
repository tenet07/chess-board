class Pawn < ApplicationRecord
  belongs_to :game

  enum :team, { team1: 0, team2: 1 }

  validates :row, inclusion: { in: 0..7 }
  validates :column, inclusion: { in: 0..7 }
end
