class Field < ApplicationRecord
  has_many_attached :photos

  validates :name, presence: true
  validates :address, presence: true
  # validates :rating, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
