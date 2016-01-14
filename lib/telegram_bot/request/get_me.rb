module TelegramBot
  # This object represents a getMe request
  class Request::GetMe < Request::Base
    def initialize(attributes = {})
      super(attributes)
      @method = :getMe
    end
  end
end
