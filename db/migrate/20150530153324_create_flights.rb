class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :user_id
      t.integer :program_id
      t.integer :destination_airport_id
      t.integer :origin_airport_id
      t.integer :miles_flown

      t.timestamps

    end
  end
end
