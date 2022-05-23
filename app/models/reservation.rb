class Reservation < ApplicationRecord
  belongs_to :room, optional: true
  belongs_to :user, optional: true

  with_options presence: true do
    validates :start_day
    validates :end_day
    validates :number_people
    validates :total_price
  end

  with_options numericality: true do
    validates :number_people
    validates :total_price
  end

  validate :start_end_check

  def start_end_check
    unless end_day.nil? || Date.today.nil? || start_day.nil?
      errors.add(:end_day, 'は開始日以降の日付で選択してください') if end_day <= start_day || end_day < Date.today
    end
  end
end
