class DropTableCallCenterUsers < ActiveRecord::Migration[6.1]
  def change
    drop_table :call_center_users
  end
end
