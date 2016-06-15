class CreateHighers < ActiveRecord::Migration
  def change
    create_table :highers do |t|
      t.string :higher
      t.string :code_letter

      t.timestamps null: false
    end
  end
end
