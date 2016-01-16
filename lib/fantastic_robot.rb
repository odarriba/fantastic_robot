require "active_model"
require "faraday"
require "fantastic_robot/models"
require "fantastic_robot/requests"
require "fantastic_robot/configuration"
require "fantastic_robot/connection"
require "fantastic_robot/version"

module FantasticRobot
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
    FantasticRobot::Request::SetWebhook.new(url: self.configuration.callback_url).send_request
  end

  ##
  # Method to respond to an update with a request.
  # It can manage a Request object or a hash.
  #
  def self.response_json(request)
    return nil unless request.is_a?(Hash) || request.is_a?(FantasticRobot::Request::Base)
    request.to_h
  end
end
