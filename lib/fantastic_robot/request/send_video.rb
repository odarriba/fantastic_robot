module FantasticRobot
  # This object represents a sendVideo request
  class Request::SendVideo < Request::Base

    MAX_FILE_SIZE = 50*1024*1024

    attr_accessor :chat_id, :video, :duration, :caption, :reply_to_message_id, :reply_markup

    validates :chat_id, :video, presence: true
    validates :chat_id, numericality: true, unless: "chat_id.to_s[0,1] == '@'"
    validates :duration, :reply_to_message_id, numericality: true, allow_blank: true

    validate :file_length

    def initialize(attributes = {})
      super(attributes)
      @method = :sendVideo
    end

    private

    # Function to check that the file size isn't excesive.
    def file_length
      if self.video.is_a?(File) && self.video.size > MAX_FILE_SIZE
        self.errors.add :video, "It's length is excesive. #{MAX_FILE_SIZE} is the limit."
        return false
      end

      return true
    end
  end
end
