class CreateTableToCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :uname
      t.string :cname
      t.string :duration
      t.string :qualification
      t.string :entry

      t.timestamps null: false
    end
  end
end
