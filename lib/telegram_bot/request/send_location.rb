module TelegramBot
  # This object represents a sendLocation request
  class Request::SendLocation < Request::Base

    attr_accessor :chat_id, :latitude, :longitude, :reply_to_message_id, :reply_markup

    validates :chat_id, :latitude, :longitude, presence: true
    validates :latitude, :longitude, numericality: true
    validates :chat_id, numericality: true, unless: "chat_id.to_s[0,1] == '@'"
    validates :reply_to_message_id, numericality: true, allow_blank: true

    def initialize(attributes = {})
      super(attributes)
      @method = :sendLocation
    end
  end
end
