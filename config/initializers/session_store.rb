# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bball_session',
  :secret      => '6e905c5a7c6f0da7b67f3f3dd908c4d91c3d427587556406509adcf6f9a29e95d8c7626c8d0546a38391e6654bf2e100f764abaed7d985afc6d9def0fad65707'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
