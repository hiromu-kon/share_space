class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user
      t.references :reservation_user
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
    add_foreign_key :reservations, :users
    add_foreign_key :reservations, :users, column: :reservation_user_id
  end
end
