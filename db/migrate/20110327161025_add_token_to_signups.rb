class AddTokenToSignups < ActiveRecord::Migration
  def self.up
    add_column :signups, :auth_token, :string
  end

  def self.down
    remove_column :signups, :auth_token
  end
end
