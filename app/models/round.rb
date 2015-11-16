class Round < ActiveRecord::Base
  validates :user_id, :deck_id, presence: true
  belongs_to :user
  belongs_to :deck
  has_many :guesses, dependent: :destroy

  # def initialize(args)
  #   @current_deck = self.deck.unguessed_cards_for_round(self.id)
  #   @guessed_deck = self.deck.guesssed_cards_for_round(self.id)
  #   super
  # end

  #ZM: This method is doing to much. By it's name it should only be in charge of
  # giving me a new card back. Some basic logic is okay like... I should only pick,
  # A new card that has not been answered yet.
  def next_card(current_cycle)

    # return @current_deck.length > 0 ? current_deck.pop : @guessed_deck.pop

    #ZM: What does #1 mean here?
    if current_cycle == 1
      #ZM: Without the to_a this is an ActiveRecord::Relation, just use cards.all instead
      cards = self.deck.cards.to_a
    else
      cards = Guess.where(round_id: self.id, correct: false, cycle: current_cycle - 1).map(&:card)
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
