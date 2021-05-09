class AddReservationIdToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :reservation_id, :bigint
  end
end
