# Be sure to restart your server when you modify this file.

Rails.application.config.session_store  :cookie_store, key: '_homeshare_session'#, domain: 'localhost'

#The following bit could possibly be used in the above configuration instead to prevent Cookie overflow,
#but only after some more configuration (I didn't finish):

#:active_record_store, key: '_homeshare_session'
