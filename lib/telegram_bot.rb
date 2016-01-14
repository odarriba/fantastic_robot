require "active_model"
require "faraday"
require "telegram_bot/models"
require "telegram_bot/requests"
require "telegram_bot/configuration"
require "telegram_bot/connection"
require "telegram_bot/version"

module TelegramBot
  class << self
    attr_accessor :configuration
    attr_reader :connection
  end

  def self.initialize!
    raise ArgumentError, "API Key is needed." if (self.configuration.api_key.blank?)

    if (self.configuration.delivery_method == :webhook)
      unless (self.configuration.callback_url.blank?)
        # Register the webhook against Telegram
        register_webhook
      else
        raise ArgumentError, 'Webhook method requires a callback URL'
      end
    end
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.connection
    @connection ||= Connection.new
  end

  ##
  # Function to register the configured webhook against the Telegram API.
  #
  def self.register_webhook
    res = self.connection.api_call(:setWebhook, {url: self.configuration.callback_url})
    raise RuntimeError, "Webhook couldn't be setted: #{res.body}" if (res.status != 200)
  end

  ##
  # Method to respond to an update with a request.
  # It can manage a Request object or a hash.
  #
  def self.response_json(request)
    return nil unless request.is_a?(Hash) || request.is_a?(TelegramBot::Request::Base)

    payload = request.to_h
    render json: payload
  end
end
