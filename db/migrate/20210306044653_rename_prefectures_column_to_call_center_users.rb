class RenamePrefecturesColumnToCallCenterUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :call_center_users, :Prefectures, :prefectures
  end
end
