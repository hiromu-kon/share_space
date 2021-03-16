class CreatePvs < ActiveRecord::Migration[6.1]
  def change
    create_table :pvs do |t|
      t.string :ip

      t.timestamps
    end
  end
end
