class AddColumnsToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :post_id, :bigint
    add_column :notifications, :room_id, :bigint
    add_index :notifications, :post_id
    add_index :notifications, :room_id
  end
end
