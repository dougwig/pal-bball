class AddSchoolToSignup < ActiveRecord::Migration
  def self.up
    add_column :signups, :preferred_school, :string
  end

  def self.down
    remove_column :signups, :preferred_school
  end
end
