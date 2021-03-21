class RenameHostUserIdColumnToMessages < ActiveRecord::Migration[6.1]
  def change
    rename_column :messages, :host_user_id, :user_id
  end
end
