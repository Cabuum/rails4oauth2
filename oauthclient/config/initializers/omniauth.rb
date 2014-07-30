Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :cabuum, ENV['OAUTH_ID'], ENV['OAUTH_SECRET']
end