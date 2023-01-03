class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_one :badge
  after_create :add_badge

  validates :username, presence: true, uniqueness: true, length: { in: 3..15 }
  validates :date_of_birth, presence: true
  validates :username, presence: true
  has_many :team_users
  has_many :teams, through: :team_users
  has_many :game_teams, through: :teams
  has_many :games, through: :game_teams
  has_many :messages
  has_many :selected_users
  has_many :leagues, through: :selected_users

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [:username, :email],
  using: {
    tsearch: { prefix: true }
  }

  # friendship-system
  has_many :invitations
  has_many :friends, through: :invitations
  has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation', foreign_key: "friend_id"

  def friends
    friends_i_sent_invitation = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
    friends_i_got_invitation = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = friends_i_sent_invitation + friends_i_got_invitation
    User.where(id: ids)
  end

  def friends_unconfirmed
    friends_i_sent_invitation = Invitation.where(user_id: id, confirmed: false).pluck(:friend_id)
    friends_i_got_invitation = Invitation.where(friend_id: id, confirmed: false).pluck(:user_id)
    ids = friends_i_sent_invitation + friends_i_got_invitation
    User.where(id: ids)
  end

  def friend_with?(user)
    Invitation.confirmed_record?(id, user.id)
  end

  def send_invitation(user)
    invitations.create(friend_id: user.id)
  end

  def add_badge
    Badge.create!(user: self)
  end

  def number_of_games_played
    teams.map(&:games_played).flatten.sum
  end

  def number_of_wins_with(teammate)
    teams.joins(team_users: :user).where(users: { id: teammate }).sum(:number_of_wins)
  end

  def number_of_played_with(teammate)
    teams.joins(team_users: :user).where(users: { id: teammate }).sum(:games_played)
  end

  def number_of_loses_with(teammate)
    number_of_played_with(teammate) - number_of_wins_with(teammate)
  end
end
