class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :reservation_user, class_name: 'User', optional: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  validate :start_end_check
  validate :start_check

  def start_end_check
    errors.add("終了日時は開始時刻より遅い時間を選択してください") if self.start_time > self.end_time
  end

  def start_check
    errors.add("開始日時は現在の日時より遅い時間を選択してください") if self.start_time < Time.now
  end
end
