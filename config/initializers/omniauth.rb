OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "41867278722-bd5b51h8ipcs9enegdmn29n4ild18ofo.apps.googleusercontent.com", "SW7Ut3HzsVvqxkOwPBAN7zuH", {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
