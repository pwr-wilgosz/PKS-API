class CreateCourseStops < ActiveRecord::Migration[5.0]
  def change
    create_table :course_stops do |t|
      t.references :course, foreign_key: true
      t.references :stop, foreign_key: true

      t.timestamps
    end
  end
end
