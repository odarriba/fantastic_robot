module TelegramBot
  # This object represents a sticker.
  class Message::Sticker < Message::Base
    attribute :file_id,   String
    attribute :file_size, Integer

    attribute :width,     Integer
    attribute :height,    Integer
    attribute :thumb,     TelegramBot::Message::PhotoSize
  end
end
