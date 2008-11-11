class CreateCategorizations < ActiveRecord::Migration
  def self.up
    create_table :categorizations, :id => false do |t|
      t.integer :minute_id, :category_id
      t.timestamps
    end
  end

  def self.down
    drop_table :categorizations
  end
end
