module TelegramBot
  # This object represents a setWebhook request
  class Request::SetWebhook < Request::Base

    attr_accessor :url

    validates :url, presence: true
    validate :https_url

    def initialize(attributes = {})
      super(attributes)
      @method = :setWebhook
    end

    private

    # Check that the URL is a HTTPS one
    def https_url
      (url[0,8] == "https://")
    end
  end
end
