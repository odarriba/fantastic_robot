require 'uri'

module TelegramBot
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  class Configuration
    attr_accessor :api_key
    attr_accessor :delivery_method
    attr_accessor :callback_url

    VALID_DELIVERY_METHODS = [:polling, :webhook]

    def initialize
      @delivery_method = :polling
    end

    def delivery_method= value
      if VALID_DELIVERY_METHODS.include?(value)
        @delivery_method = value
      else
        raise ArgumentError, "No valid reception method. Options available: #{VALID_DELIVERY_METHODS}"
      end
      @delivery_method
    end

    def callback_url= value
      unless (value =~ URI::regexp).nil?
        @callback_url = value
      else
        raise ArgumentError, "Invalid callback URL"
      end
    end
  end
end
