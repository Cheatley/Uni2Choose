class AddUnameToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :uname, :string
  end
end
