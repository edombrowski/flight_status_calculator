class AddProgramtoUser < ActiveRecord::Migration
  def change
    remove_column :users, :primary_hotel_program, :string
    remove_column :users, :primary_rental_car_program
    rename_column :users, :primary_airline_program, :program_id
  end
end
