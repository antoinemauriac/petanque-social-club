class Message < ApplicationRecord
  belongs_to :league
  belongs_to :user

  # validates :comment, length: { in: 1..100 }
  validates :comment, length: { minimum: 1 }
end
