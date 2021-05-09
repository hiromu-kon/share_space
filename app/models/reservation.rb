class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :reservation_user, class_name: 'User', optional: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :opportunity_type, presence: true, on: :update

  validate :start_end_check
  validate :start_check
  validate :start_end_day

  def start_end_check
    errors.add("終了日時は開始時刻より遅い時間を選択してください") if self.start_time > self.end_time
  end

  def start_check
    errors.add("開始日時は現在の日時より遅い時間を選択してください") if self.start_time < Time.now
  end

  def start_end_day
    errors.add("日付を跨いで登録できません") if start_time.day != end_time.day
  end

  def create_notification_reservation!(current_user, reservation_id)
    temp_ids = Reservation.select(user_id).where(user_id: current_user.id).where.not(reservation_user_id: nil).distinct
    temp_ids.each do |temp_id|
      notification = current_user.active_notifications.new(
        reservation_id: id,
        visited_id: user_id,
        action: 'reservation'
      )
      notification.save
    end
  end
end
