class DropTableToCourses < ActiveRecord::Migration
  def change
    drop_table :courses
  end
end
