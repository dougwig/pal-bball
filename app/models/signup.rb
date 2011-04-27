class Signup < ActiveRecord::Base
  before_save :generate_auth_token

  validates_presence_of :team_sex
  validates_presence_of :player1_name, :player1_dob_month, :player1_dob_day, :player1_dob_year, :player1_tshirt_size
  
  def TEAM_SEXES
    [ "Boys", "Girls" ]
  end
  def TEAM_LEVELS
    [ "Recreational", "Competitive" ]
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
  
  def TSHIRT_SIZES
    [ "YS (Youth Small)", 
      "YM (Youth Medium)", 
      "YL (Youth Large)", 
      "YXL (Youth X-Large)", 
      "AS (Adult Small)", 
      "AM (Adult Medium)",
      "AL (Adult Large)",
      "AXL (Adult X-Large)",
      "AXXL (Adult XX-Large)" ]
  end
  
  def SCHOOLS
    [ "Eagle",
      "Heritage",
      "Kuna",
      "Lake Hazel",
      "Lewis & Clark",
      "Lowell Scott",
      "Meridian",
      "Sawtooth" ]
  end
  
  def price
    price = 0
    price += price_per_kid(player1_dob_month, player1_dob_day, player1_dob_year)
    unless (player2_name.blank?)
      price += price_per_kid(player2_dob_month, player2_dob_day, player2_dob_year)
    end
    unless (player3_name.blank?)
      price += price_per_kid(player3_dob_month, player3_dob_day, player3_dob_year)
    end
    unless (player4_name.blank?)
      price += price_per_kid(player4_dob_month, player4_dob_day, player4_dob_year)
    end
    price
  end
  
private
  def generate_auth_token
    if (self.auth_token.blank?)
      self.auth_token = ::ActiveSupport::SecureRandom.base64(15).tr('+/=', '-_ ').strip.delete("\n")
    end
  end

  def age(datestr)
    birthday = Date.parse(datestr)
    today = Date.today
    age = today.year - birthday.year
    age -= 1 if today < birthday + age.years #for days before birthday
    logger.info "AGE datestr=#{datestr}, age=#{age}"
    age
  end
  def price_per_kid(mon, day, year)
    a = age("#{mon}/#{day}/#{year}")
    if (a <= 8)
      65
    else
      70
    end
  end
end
