class CreateStaffpicsCategory < ActiveRecord::Migration
  def self.up
    Category.create(:name => 'Staff pics')
  end

  def self.down
    Category.delete(:conditions => "name = 'Staff pics'")
  end
end
