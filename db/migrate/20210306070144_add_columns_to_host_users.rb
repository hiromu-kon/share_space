class AddColumnsToHostUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :host_users, :industry, :string
    add_column :host_users, :average_age, :integer
    add_column :host_users, :introduction, :text
    add_column :host_users, :employee, :integer
    add_column :host_users, :prefectures, :string
    add_column :host_users, :home_page, :string
  end
end
