class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keyword
      t.boolean :standard_grades
      t.string :select_course

      t.timestamps null: false
    end
  end
end
