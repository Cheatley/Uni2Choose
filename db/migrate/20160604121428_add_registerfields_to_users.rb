class AddRegisterfieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dob, :datetime
    add_column :users, :gender, :string
    add_column :users, :postcode, :string
  end
end
