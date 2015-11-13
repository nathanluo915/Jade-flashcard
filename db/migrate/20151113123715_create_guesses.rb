class CreateGuesses < ActiveRecord::Migration
  def change
    create_table  :guesses do |t|
      t.integer :round_id, null: false
      t.integer :card_id, null: false
      t.integer  :cycle, null: false, default: 0
      t.boolean  :correct, null: false

      t.timestamps null: false
    end
  end
end
