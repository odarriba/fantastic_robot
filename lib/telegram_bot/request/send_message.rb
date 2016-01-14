module TelegramBot
  # This object represents a Telegram user or bot.
  class Request::SendMessage < Request::Base

    attr_accessor :chat_id, :text, :parse_mode, :disable_web_page_preview, :reply_to_message_id, :reply_markup

    validates :chat_id, :text, presence: true
    validates :chat_id, numericality: true
    validates :disable_web_page_preview, inclusion: {in: [true, false]}, allow_blank: true
    validates :reply_to_message_id, numericality: true, allow_blank: true

    def initialize(attributes = {})
      super(attributes)
      @method = :sendMessage
    end
  end
end
