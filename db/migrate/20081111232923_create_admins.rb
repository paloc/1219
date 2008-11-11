class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.string :username, :password
      t.timestamps
    end
    Admin.create(:username => 'changeme', :password => 'changeme')
  end

  def self.down
    drop_table :admins
  end
end
