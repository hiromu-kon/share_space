class RemoveCallCenterUserIdFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :posts, :call_center_users
    remove_index :posts, :call_center_user_id
    remove_column :posts, :call_center_user_id, :bigint
  end
end
