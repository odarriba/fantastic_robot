module FantasticRobot
  # This object represents a sendVoice request
  class Request::SendVoice < Request::Base

    MAX_FILE_SIZE = 50*1024*1024

    attr_accessor :chat_id, :voice, :duration, :reply_to_message_id, :reply_markup

    validates :chat_id, :voice, presence: true
    validates :chat_id, numericality: true, unless: -> { chat_id.to_s[0,1] == '@' }
    validates :duration, :reply_to_message_id, numericality: true, allow_blank: true

    validate :file_length

    def initialize(attributes = {})
      super(attributes)
      @method = :sendVoice
    end

    private

    # Function to check that the file size isn't excesive.
    def file_length
      if self.voice.is_a?(File) && self.voice.size > MAX_FILE_SIZE
        self.errors.add :voice, "It's length is excesive. #{MAX_FILE_SIZE} is the limit."
        return false
      end

      return true
    end
  end
end
