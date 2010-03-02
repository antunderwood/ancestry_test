# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ancestry_test_session',
  :secret      => 'ecbe87845d2d5199830ea2e413f665a254b6fc64a57188b7d9a943982aa6775c7a5bf0f568fd4ad8e7d680747d4244c792f362c5d1c48c8f1d3e3ade8eec1e64'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
