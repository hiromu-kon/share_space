class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :notifications, dependent: :destroy

  validates :message, presence: true, length: { maximum: 1000 }

  def create_message_notification(user)
    message_notification = user.passive_notifications.build(
      visitor_id: user_id,
      message_id: id,
      action: 'message'
    )
    message_notification.save if message_notification.valid?
  end
end
