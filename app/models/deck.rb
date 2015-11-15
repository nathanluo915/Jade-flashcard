class Deck < ActiveRecord::Base
  validates :name, presence: true
  has_many :rounds, dependent: :destroy
  has_many :cards
end
