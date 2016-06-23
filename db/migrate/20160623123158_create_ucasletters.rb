class CreateUcasletters < ActiveRecord::Migration
  def change
    create_table :ucasletters do |t|
      t.string :ucas_letter
      t.string :subject_group

      t.timestamps null: false
    end
  end
end
