class CreatePawns < ActiveRecord::Migration[8.0]
  def change
    create_table :pawns do |t|
      t.integer :row, null: false
      t.integer :column, null: false
      t.integer :team, null: false
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
