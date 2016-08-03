class AddReferenceToHighers < ActiveRecord::Migration
  def change
    add_reference :highers, :ucasletters, index: true
  end
end
