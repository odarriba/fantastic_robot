module TelegramBot
  # This object represents a video file.
  class Message::Video < Message::Base
    attribute :file_id,   String
    attribute :file_size, Integer

    attribute :width,     Integer
    attribute :height,    Integer
    attribute :duration,  Integer
    attribute :thumb,     TelegramBot::Message::PhotoSize
    attribute :mime_type, String
  end
end
