class AddReferenceToDegrees < ActiveRecord::Migration
  def change
    add_reference :degrees, :universities, index: true
    add_reference :degrees, :ucasletters, index: true
  end
end
