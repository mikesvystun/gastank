Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["GAS_TANK_FACEBOOK_APP_ID"], ENV["GAS_TANK_FACEBOOK_APP_SECRET"], info_fields: 'email,first_name'
end
