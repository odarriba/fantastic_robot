module TelegramBot
  # This object represents a sticker.
  class Message::Attachment::Sticker < Message::Attachment::Base
    attribute :file_id,   String
    attribute :file_size, Integer

    attribute :width,     Integer
    attribute :height,    Integer
    attribute :thumb,     TelegramBot::Message::Attachment::PhotoSize
  end
end
