class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :user_id, null: false
      t.integer :deck_id, null: false
      t.integer :first_round_correct, null: false, default: 0
      t.integer :total_guesses, null: false, default: 0

      t.timestamps null: false
    end
  end
end
