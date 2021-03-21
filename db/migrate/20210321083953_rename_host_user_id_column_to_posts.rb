class RenameHostUserIdColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :host_user_id, :user_id
  end
end
