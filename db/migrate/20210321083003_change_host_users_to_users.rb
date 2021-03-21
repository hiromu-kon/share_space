class ChangeHostUsersToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_table :host_users, :users
  end
end
