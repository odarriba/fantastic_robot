module TelegramBot
  # This object represents one size of a photo or a file / sticker thumbnail.
  class MessageElement::PhotoSize < MessageElement::Base
    attribute :file_id,   String
    attribute :file_size, Integer

    attribute :width,     Integer
    attribute :height,    Integer
  end
end
