class League < ApplicationRecord
  validates :name, presence: true, length: { in: 3..25 }
  has_many :games
  has_many :teams
  has_many :messages
end
