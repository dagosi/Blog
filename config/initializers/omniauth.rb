Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FB_KEY'], ENV['FB_SECRET']
  provider :twitter, ENV['TW_KEY'], ENV['TW_SECRET']
end
