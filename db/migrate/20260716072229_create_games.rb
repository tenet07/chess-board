class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.integer :state, null: false, default: 0
      t.integer :current_turn, null: false, default: 0
      t.string :final_state

      t.timestamps
    end

    add_index :games, :state
  end
end
