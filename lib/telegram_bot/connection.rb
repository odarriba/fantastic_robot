require "faraday"

module TelegramBot
  class Connection
    attr_reader :conn

    # White-listed API methods
    VALID_API_METHODS = [:setWebhook]

    def initialize
      # Create the connection object to make calls to the API
      @conn = Faraday.new(:url => "https://api.telegram.org/bot#{TelegramBot.configuration.api_key}/") do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    # Function to call API passing a payload
    def api_call method, payload
      raise ArgumentError, "Not valid API method. Options available: #{VALID_API_METHODS}" unless VALID_API_METHODS.include?(method)

      res = @conn.post do |req|
        req.url method.to_s
        req.headers['Content-Type'] = 'application/json'
        req.body = payload.to_json
      end

      return res
    end
  end
end
