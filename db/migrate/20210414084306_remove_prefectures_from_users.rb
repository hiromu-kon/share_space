class RemovePrefecturesFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :prefectures, :string
  end
end
