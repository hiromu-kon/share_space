class AddColumnsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :status, :integer, default: 0, null:false
    add_column :posts, :industry, :integer, default: 0, null:false
  end
end
