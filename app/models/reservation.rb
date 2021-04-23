class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :reservation_user, class_name: 'User', optional: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
