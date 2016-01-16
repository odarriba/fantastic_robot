require "faraday"
require "open-uri"

module TelegramBot
  class Connection
    attr_reader :conn

    def initialize
      # Create the connection object to make calls to the API
      @conn = Faraday.new(:url => "https://api.telegram.org/bot#{TelegramBot.configuration.api_key}/") do |faraday|
        faraday.request :multipart
        faraday.request :url_encoded
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  :net_http  # make requests with Net::HTTP
      end
    end

    # Function to call API passing a payload
    def api_call method, payload
      raise ArgumentError, "API method not specified." if method.blank?

      payload ||= {}

      res = @conn.post method.to_s, payload

      raise Faraday::Error, "Wrong response: #{res.inspect}" if (res.status != 200)

      return res
    end

    def get_by_path path
      return open("https://api.telegram.org/bot#{TelegramBot.configuration.api_key}/#{path}")
      raise Faraday::Error, "Wrong response: #{res.inspect}" if (res.status != 200)
    end
  end
end
