OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '258205877970049', 'b55fef4f1924cc1461c75f1f3044697e'
end