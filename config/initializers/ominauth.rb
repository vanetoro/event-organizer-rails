OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '483828829678-ksbabpitm9uc9nr7o5t9476pqmu81v9q.apps.googleusercontent.com', 'JVH6TEbg8ENM7UY4Kyg9s6GW', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
