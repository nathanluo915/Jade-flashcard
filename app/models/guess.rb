class Guess < ActiveRecord::Base
  validates :round_id, :card_id, :content, presence: true
  belongs_to :round
  belongs_to :card

end
