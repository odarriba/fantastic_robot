module TelegramBot
  # This object represents a voice note.
  class Message::Voice < Message::Base
    attribute :file_id,   String
    attribute :file_size, Integer

    attribute :duration,  Integer
    attribute :mime_type, String
  end
end
