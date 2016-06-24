class CreateSimilarities < ActiveRecord::Migration
  def change
    create_table :similarities do |t|
      t.string :ucas_letter
      t.string :compared_ucas_letter
      t.float :similarity

      t.timestamps null: false
    end
  end
end
