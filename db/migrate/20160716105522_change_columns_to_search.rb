class ChangeColumnsToSearch < ActiveRecord::Migration
  def change
    remove_column :searches, :not_interested
    remove_column :searches, :select_course1
    remove_column :searches, :select_course2
    remove_column :searches, :select_course3
    remove_column :searches, :select_course4
    remove_column :searches, :select_course5
    add_column :searches, :saved_search, :varchar
    add_reference :searches, :users, index: true
  end
end
