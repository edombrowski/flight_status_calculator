class AddRoundTriptoFlight < ActiveRecord::Migration
  def change
    add_column :flights, :round_trip, :boolean
  end
end
