class CreateGuesses < ActiveRecord::Migration
  def change
    create_table  :guesses do |t|
      t.integer :round_id, null: false
      t.integer :card_id, null: false
      t.string  :content, null: false

      t.timestamps null: false
    end
  end
end
