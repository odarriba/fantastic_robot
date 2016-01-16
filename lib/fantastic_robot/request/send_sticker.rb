module FantasticRobot
  # This object represents a sendSticker request
  class Request::SendSticker < Request::Base

    MAX_FILE_SIZE = 50*1024*1024

    attr_accessor :chat_id, :sticker, :reply_to_message_id, :reply_markup

    validates :chat_id, :sticker, presence: true
    validates :chat_id, numericality: true, unless: "chat_id.to_s[0,1] == '@'"
    validates :reply_to_message_id, numericality: true, allow_blank: true

    def initialize(attributes = {})
      super(attributes)
      @method = :sendSticker
    end
  end
end
