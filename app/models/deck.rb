class Deck < ActiveRecord::Base
  #ZM: Switch has_many, and validates for ordering
  validates :name, presence: true
  has_many :rounds, dependent: :destroy
  has_many :cards
end
