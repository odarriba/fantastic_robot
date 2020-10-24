module FantasticRobot
  # This object represents a forwardMessage request
  class Request::ForwardMessage < Request::Base

    attr_accessor :chat_id, :from_chat_id, :message_id, :disable_web_page_preview, :reply_to_message_id, :reply_markup

    validates :chat_id, :from_chat_id, :message_id, presence: true
    validates :message_id, presence: true
    validates :chat_id, numericality: true, unless: -> { chat_id.to_s[0,1] == '@' }
    validates :from_chat_id, numericality: true, unless: -> { from_chat_id.to_s[0,1] == '@' }
    validates :reply_to_message_id, numericality: true, allow_blank: true

    def initialize(attributes = {})
      super(attributes)
      @method = :forwardMessage
    end
  end
end
