class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :name
      t.references :bus, foreign_key: true
      t.text :description
      t.boolean :solved

      t.timestamps
    end
  end
end

