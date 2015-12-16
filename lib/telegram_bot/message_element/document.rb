module TelegramBot
  # This object represents a general file (as opposed to photos, voice messages and audio files).
  class MessageElement::Document < MessageElement::Base
    attribute :file_id,   String
    attribute :file_size, Integer

    attribute :thumb,     TelegramBot::MessageElement::PhotoSize
    attribute :file_name, String
    attribute :mime_type, String
  end
end
