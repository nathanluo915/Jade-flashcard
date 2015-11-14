class Round < ActiveRecord::Base
  validates :user_id, :deck_id, presence: true
  belongs_to :user
  belongs_to :deck
  has_many :guesses, dependent: :destroy

  def next_card(current_cycle)
    if current_cycle == 1
      cards = self.deck.cards.to_a
    else
      cards = Guess.where(round_id: round_id, correct: false, cycle: current_cycle - 1).map(&:card)
    end

    cards.shuffle!

    while card = cards.pop
      # binding.pry
      if !Guess.exists?(round_id: self.id, card_id: card.id, cycle: current_cycle)
        break
      end
    end

    card
  end

end
