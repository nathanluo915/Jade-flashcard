class User < ActiveRecord::Base
  include BCrypt
  
  has_many :rounds, dependent: :destroy
  has_many :decks, through: :rounds
  has_many :guesses, through: :rounds
  
  validates :username, :email, :password_hash, presence: true

  # users.password_hash in the database is a :string

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
