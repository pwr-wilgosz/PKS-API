class CreateBuses < ActiveRecord::Migration[5.0]
  def change
    create_table :buses do |t|
      t.integer :spaces
      t.string :registration_number
      t.string :brand

      t.timestamps
    end
  end
end
