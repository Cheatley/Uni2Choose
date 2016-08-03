class AddUrlColumnToDegrees < ActiveRecord::Migration
  def change
    add_column :degrees, :url, :string
  end
end
