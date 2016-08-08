require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Homeshare
  class Application < Rails::Application

    config.middleware.insert_before 0, Rack::Cors do
     allow do
       origins '*'
       resource '*', :headers => :any, :methods => :any
     end

     ActionMailer::Base.smtp_settings = {
       :user_name => ENV['SENDGRID_USERNAME'],
       :password => ENV['SENDGRID_PASSWORD'],
       :domain => 'heroku.com',
       :address => 'smtp.sendgrid.net',
       :port => 587,
       :authentication => :plain,
       :enable_starttls_auto => true
     }
   end

   # Rails 5

   config.middleware.insert_before 0, Rack::Cors do
     allow do
       origins '*'
       resource '*', :headers => :any, :methods => :any
     end
   end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
