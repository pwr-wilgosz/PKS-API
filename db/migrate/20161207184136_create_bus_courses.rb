class CreateBusCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :bus_courses do |t|
      t.references :bus, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
