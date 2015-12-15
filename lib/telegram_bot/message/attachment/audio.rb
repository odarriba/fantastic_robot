module TelegramBot
  # This object represents an audio file to be treated as music by the Telegram clients.
  class Message::Attachment::Audio < Message::Attachment::Base
    attribute :file_id,   Integer
    attribute :file_size, Integer

    attribute :duration,  Integer
    attribute :performer, String
    attribute :title,     String
    attribute :mime_type, String
  end
end
