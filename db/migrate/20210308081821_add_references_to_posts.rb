class AddReferencesToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :host_user, foreign_key: true
    add_reference :posts, :call_center_user, foreign_key: true
  end
end
