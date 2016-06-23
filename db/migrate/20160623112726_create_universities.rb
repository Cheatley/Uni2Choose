class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :uname
      t.string :uregion
      t.string :ulogo

      t.timestamps null: false
    end
  end
end
