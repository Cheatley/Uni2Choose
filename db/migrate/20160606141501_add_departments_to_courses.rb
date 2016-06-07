class AddDepartmentsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :departments, :string
  end
  
end
