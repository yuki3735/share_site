class Room < ApplicationRecord
  mount_uploader :room_img, ImageUploader
  belongs_to :user, optional: true
  has_many :reservations

  with_options presence: true do
    validates :roomname
    validates :introduction
    validates :price
    validates :address
    validates :room_img
  end

  validates :introduction, length: {in: 1..300}
  validates :price, numericality: true
end
