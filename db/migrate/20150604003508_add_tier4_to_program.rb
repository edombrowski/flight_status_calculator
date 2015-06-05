class AddTier4ToProgram < ActiveRecord::Migration
  def change
    add_column :programs, :t4_name, :string
    add_column :programs, :t4_threshold, :integer
  end
end
