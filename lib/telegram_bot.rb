require "active_model"
require "telegram_bot/models"
require "telegram_bot/configuration"
require "telegram_bot/version"

module TelegramBot
  class << self
    attr_accessor :configuration
  end

  def self.initialize!
    raise ArgumentError, "API Key is needed." if (self.configuration.api_key.blank?)

    if (self.configuration.delivery_method == :webhook)
      unless (self.configuration.callback_url.blank?)
        # TODO: Register the webhook
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
end
