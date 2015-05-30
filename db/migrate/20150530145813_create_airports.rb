class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :airport_code
      t.string :airport_name
      t.float :latitude
      t.float :longitude

      t.timestamps

    end
  end
end
