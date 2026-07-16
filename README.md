# Chess (Pawns Only)

## Problem Statement

Build a simplified, two-player chess variant played with pawns only on a standard 8x8 board.

- The board has 8 rows and 8 columns, each cell identified by a `(row, column)` pair, with values from `0` to `7`.
- Each player (Team 1 and Team 2) starts with 8 pawns, one in every column of their back row.
  - Team 1's pawns start on row `0`.
  - Team 2's pawns start on row `7`.
- Players alternate turns, starting with Team 1. On a turn, a player must move exactly one of their own pawns.
- A pawn can move in one of two ways:
  - **Move**: one cell straight ahead (Team 1 moves toward increasing rows, Team 2 toward decreasing rows), only if that cell is empty.
  - **Capture**: one cell diagonally ahead, only if that cell is occupied by an opposing pawn. The opposing pawn is removed from the board.
- A player wins when either:
  - One of their pawns reaches the opposite back row (Team 1 reaches row `7`, Team 2 reaches row `0`), or
  - Every one of the opponent's pawns has been captured.
- The game ends immediately once a player wins.
