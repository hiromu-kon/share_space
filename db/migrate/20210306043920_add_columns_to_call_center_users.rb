class AddColumnsToCallCenterUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :call_center_users, :industry, :string
    add_column :call_center_users, :average_age, :integer
    add_column :call_center_users, :introduction, :text
    add_column :call_center_users, :employee, :integer
    add_column :call_center_users, :Prefectures, :string
    add_column :call_center_users, :home_page, :string
  end
end
