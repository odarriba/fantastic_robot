module FantasticRobot
  # This object represents a sendPhoto request
  class Request::SendPhoto < Request::Base

    attr_accessor :chat_id, :photo, :caption, :reply_to_message_id, :reply_markup

    validates :chat_id, :photo, presence: true
    validates :chat_id, numericality: true, unless: "chat_id.to_s[0,1] == '@'"
    validates :reply_to_message_id, numericality: true, allow_blank: true

    def initialize(attributes = {})
      super(attributes)
      @method = :sendPhoto
    end
  end
end
