class Changev2ColumnsToSearches < ActiveRecord::Migration
  def change
    remove_column :searches, :select_course
    add_column :searches, :select_course1, :string
    add_column :searches, :select_course2, :string
    add_column :searches, :select_course3, :string
    add_column :searches, :select_course4, :string
    add_column :searches, :select_course5, :string
  end
end
