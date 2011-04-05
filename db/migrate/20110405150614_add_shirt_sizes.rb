class AddShirtSizes < ActiveRecord::Migration
  def self.up
      add_column :signups, :player1_tshirt_size, :string
      add_column :signups, :player2_tshirt_size, :string
      add_column :signups, :player3_tshirt_size, :string
      add_column :signups, :player4_tshirt_size, :string
    end

    def self.down
      remove_column :signups, :player1_tshirt_size
      remove_column :signups, :player2_tshirt_size
      remove_column :signups, :player3_tshirt_size
      remove_column :signups, :player4_tshirt_size
  end
end
