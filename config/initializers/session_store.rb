# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_seandick.com_session',
  :secret      => '29312de7e3bf29d5e26f5f36e8caa481c6c059570c3e3d4722a3eb1f5aa57d11526ec472355d35ae1d411779baff0a5e8efeccd7469069b5bb0254917ad096d3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
