# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_source_session',
  :secret      => '7bf01b216f86ebac1789cb4eec8a6528fc194809db324afe043d47b04d2856be05f38d96ee994513a782678b52c97d8b457ce33cb6cb07a1e6e5c99de347bc16'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
