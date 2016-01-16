module TelegramBot
  # This object represents a sticker.
  class Model::Attachment::Sticker < Model::Attachment::Base

    attr_accessor :file_id, :file_size, :width, :height, :thumb

    validates :file_id, :width, :height, presence: true
    validates :width, :height, numericality: true
    validates :file_size, numericality: true, unless: 'file_size.blank?'

    # Field conversions of this model
    FIELD_CONVERSIONS = {
      thumb: TelegramBot::Model::Attachment::PhotoSize
    }

  end
end
