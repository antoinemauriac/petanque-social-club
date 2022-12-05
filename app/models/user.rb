class User < ApplicationRecord
  has_one_attached :photo
  has_one :badge

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [:username, :email],
  using: {
    tsearch: { prefix: true }
  }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :username, presence: true, uniqueness: true, length: { in: 3..18 }
  validates :date_of_birth, presence: true
  has_many :team_users
  has_many :teams, through: :team_users
  has_many :messages

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

end
