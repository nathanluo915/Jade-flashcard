class Round < ActiveRecord::Base
  validates :user_id, :deck_id, presence: true
  belongs_to :user
  belongs_to :deck
  has_many :guesses, dependent: :destroy
end
