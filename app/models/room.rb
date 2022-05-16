class Room < ApplicationRecord
  mount_uploader :room_img, ImageUploader
  belongs_to :user
  has_many :reservations
end