module TelegramBot
  # This object represents one size of a photo or a file / sticker thumbnail.
  class Message::Attachment::PhotoSize < Message::Attachment::Base
    attribute :file_id,   String
    attribute :file_size, Integer

    attribute :width,     Integer
    attribute :height,    Integer
  end
end
