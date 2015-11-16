class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses, dependent: :destroy
  
  validates :deck_id, :question, :answer, presence: true

  #ZM: Why is there no logic in the card?
end
