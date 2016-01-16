TelegramBot.configure do |config|
  # Secret token of the API
  config.api_key = 'your_bot_api_token'

  # Delivery method (can be :polling or :webhook)
  config.delivery_method = :webhook

  # Callback URL of the webhook
  config.callback_url = 'http://your_app.dev/receive'
end

TelegramBot.initialize! if(defined?(::Thin) || defined?(::Unicorn) || defined?(::Passenger) || defined?(::Puma))
