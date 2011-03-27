class AddLevelToSignups < ActiveRecord::Migration
  def self.up
    add_column :signups, :team_level, :string
  end

  def self.down
    remove_column :signups, :team_level
  end
end
