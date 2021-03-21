class RenameHostUserIdColumnToEntries < ActiveRecord::Migration[6.1]
  def change
    rename_column :entries, :host_user_id, :user_id
  end
end
