class AddCnameToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :cname, :string
  end
end
