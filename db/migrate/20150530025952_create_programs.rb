class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.integer :t3_threshold
      t.string :t3_name
      t.integer :t2_threshold
      t.string :t2_name
      t.integer :t1_threshold
      t.string :t1_name
      t.string :program_type
      t.string :program_name

      t.timestamps

    end
  end
end
