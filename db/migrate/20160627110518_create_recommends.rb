class CreateRecommends < ActiveRecord::Migration
  def change
    create_table :recommends do |t|
      t.string :topic
      t.integer :a
      t.integer :b
      t.integer :c
      t.integer :d
      t.integer :f
      t.integer :g
      t.integer :h
      t.integer :j
      t.integer :k
      t.integer :l
      t.integer :m
      t.integer :p
      t.integer :q
      t.integer :r
      t.integer :t
      t.integer :v
      t.integer :w
      t.integer :x

      t.timestamps null: false
    end
  end
end
