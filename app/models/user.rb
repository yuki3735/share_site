class User < ApplicationRecord
  mount_uploader :profile_img_id, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :rooms
  has_many :reservations
end
