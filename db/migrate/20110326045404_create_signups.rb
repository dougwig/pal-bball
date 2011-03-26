class CreateSignups < ActiveRecord::Migration
  def self.up
    create_table :signups do |t|
      t.string :team_sex
      t.string :coach_name
      t.string :coach_phone
      t.string :coach_address
      t.string :coach_email
      t.string :player1_name
      t.string :player1_address
      t.string :player1_phone
      t.string :player1_email
      t.integer :player1_dob_month
      t.integer :player1_dob_day
      t.integer :player1_dob_year
      t.string :player2_name
      t.string :player2_address
      t.string :player2_phone
      t.string :player2_email
      t.integer :player2_dob_month
      t.integer :player2_dob_day
      t.integer :player2_dob_year
      t.string :player3_name
      t.string :player3_address
      t.string :player3_phone
      t.string :player3_email
      t.integer :player3_dob_month
      t.integer :player3_dob_day
      t.integer :player3_dob_year
      t.string :player4_name
      t.string :player4_address
      t.string :player4_phone
      t.string :player4_email
      t.integer :player4_dob_month
      t.integer :player4_dob_day
      t.integer :player4_dob_year

      t.timestamps
    end
  end

  def self.down
    drop_table :signups
  end
end
