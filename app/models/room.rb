class Room < ApplicationRecord
  geocoded_by :address
  has_one_attached :photo
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :adult_space, presence: true, numericality: true
  validates :child_space, presence: true, numericality: true
  validates :infant_space, presence: true, numericality: true
  validates :beds, presence: true, numericality: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :facilities, inclusion: { in: ["Shared", "Private"] }

  def photo_url_or_default
    if photo.attached?
      photo.key
    else
      "default_v9rlap"
    end
  end
end
