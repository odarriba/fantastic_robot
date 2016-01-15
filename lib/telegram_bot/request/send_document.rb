module TelegramBot
  # This object represents a sendDocument request
  class Request::SendDocument < Request::Base

    MAX_FILE_SIZE = 50*1024*1024

    attr_accessor :chat_id, :document, :reply_to_message_id, :reply_markup

    validates :chat_id, :document, presence: true
    validates :chat_id, numericality: true, unless: "chat_id.to_s[0,1] == '@'"
    validates :reply_to_message_id, numericality: true, allow_blank: true

    validate :file_length

    def initialize(attributes = {})
      super(attributes)
      @method = :sendDocument
    end

    private

    # Function to check that the file size isn't excesive.
    def file_length
      if self.document.is_a?(File) && self.document.size > MAX_FILE_SIZE
        self.errors.add :document, "It's length is excesive. #{MAX_FILE_SIZE} is the limit."
        return false
      end

      return true
    end
  end
end
