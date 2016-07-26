Rails.application.config.middleware.use OmniAuth::Builder do
  provider :paypal, ENV['PAYPAL_CLIENT_ID'], ENV['PAYPAL_SECRET'], sandbox: true, scope: "openid profile email"
end
