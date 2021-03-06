class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :reward
      t.integer :recruit_people
      t.date :start_date
      t.date :finish_date
      t.integer :user_id

      t.timestamps
    end
  end
end
