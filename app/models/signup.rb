class Signup < ActiveRecord::Base
  before_save :generate_auth_token

  validates_presence_of :team_sex
  validates_presence_of :coach_name, :coach_email, :coach_phone
  validates_presence_of :player1_name, :player1_dob_month, :player1_dob_day, :player1_dob_year
  validates_presence_of :player2_name, :player2_dob_month, :player2_dob_day, :player2_dob_year
  validates_presence_of :player3_name, :player3_dob_month, :player3_dob_day, :player3_dob_year
  
  def TEAM_SEXES
    [ "Boys", "Girls" ]
  end
  
  def DOB_MONTHS
    [nil] + (1..12).to_a
  end
  def DOB_DAYS
    [nil] + (1..31).to_a
  end
  def DOB_YEARS
    [nil] + (Time.now.year-20..Time.now.year).to_a
  end
  
private
  def generate_auth_token
    if (self.auth_token.blank?)
      self.auth_token = ::ActiveSupport::SecureRandom.base64(15).tr('+/=', '-_ ').strip.delete("\n")
    end
  end
end
