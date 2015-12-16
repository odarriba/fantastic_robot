module TelegramBot
  # This object represents a video file.
  class Model::MessageAttachment::Video < Model::MessageAttachment::Base

    attr_accessor :file_id, :file_size, :width, :height, :duration, :thumb, :mime_type

    validates :file_id, :width, :height, :duration, presence: true
    validates :width, :height, :duration, numericality: true
    validates :file_size, numericality: true, unless: 'file_size.blank?'

    # Field conversions of this model
    FIELD_CONVERSIONS = {
      thumb: TelegramBot::Model::MessageAttachment::PhotoSize
    }
    
  end
end
