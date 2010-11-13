# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_althea_session',
  :secret      => '46348a3d46d0a7c8cdcc350f11d3290404766eb03f37613542a987e7ca53a9ebcbe38c602f8b96569cbefc3bdc9d2efc308eb81a7df6fb4cf58e902167a2c677'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
