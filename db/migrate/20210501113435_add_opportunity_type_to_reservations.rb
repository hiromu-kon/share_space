class AddOpportunityTypeToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :opportunity_type, :string
  end
end
