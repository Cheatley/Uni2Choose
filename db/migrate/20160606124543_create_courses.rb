class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_title
      t.string :ucas_code
      t.string :highers
      t.string :degree_type

      t.timestamps null: false
    end
  end
end
