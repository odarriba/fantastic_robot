module TelegramBot
  # This object represents a sticker.
  class MessageElement::Sticker < MessageElement::Base
    attribute :file_id,   String
    attribute :file_size, Integer

    attribute :width,     Integer
    attribute :height,    Integer
    attribute :thumb,     TelegramBot::MessageElement::PhotoSize
  end
end
