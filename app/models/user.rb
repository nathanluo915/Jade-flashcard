class User < ActiveRecord::Base
  validates :username, :email, :password_hash, presence: true
  has_many :rounds, dependent: :destroy
  has_many :decks, through: :rounds
  has_many :guesses, through: :rounds

end
