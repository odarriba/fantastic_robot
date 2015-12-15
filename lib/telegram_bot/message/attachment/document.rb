module TelegramBot
  # This object represents a general file (as opposed to photos, voice messages and audio files).
  class Message::Attachment::Document < Message::Attachment::Base
    attribute :file_id,   String
    attribute :file_size, Integer

    attribute :thumb,     TelegramBot::Message::Attachment::PhotoSize
    attribute :file_name, String
    attribute :mime_type, String
  end
end
