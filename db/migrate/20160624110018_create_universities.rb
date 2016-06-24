class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :uname
      t.string :uregion
      t.string :ulogo
    end
  end
end
