class ChangeColumnsToSearches < ActiveRecord::Migration
  def change
    remove_column :searches, :keyword
    remove_column :searches, :standard_grades
    add_column :searches, :not_interested, :string
  end
end
