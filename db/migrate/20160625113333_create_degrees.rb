class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.string :uname
      t.string :cname
      t.string :ucas
      t.string :duration
      t.string :qualification
      t.string :entry

      t.timestamps null: false
    end
  end
end
