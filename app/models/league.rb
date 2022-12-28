class League < ApplicationRecord
  validates :name, presence: true, length: { in: 3..25 }
  has_many :games
  has_many :teams
  has_many :team_users, through: :teams
  has_many :messages
  has_many :selected_users
  has_many :users, through: :selected_users
end
