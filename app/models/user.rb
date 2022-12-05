class User < ApplicationRecord
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :username, presence: true, uniqueness: true, length: { in: 3..18 }
  validates :date_of_birth, presence: true
  has_many :team_users
  has_many :teams, through: :team_users
  has_many :messages
  has_one :badge
end
